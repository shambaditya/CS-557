package project

import chisel3._
//lagom

class PE_Module(val dim : 128, val paral : UInt = 1, val W: UInt = 64) extends Module {
  val io = IO(new Bundle {
    val query = Flipped(Decoupled(Vec(paral, Bits(W.W)))) // broadcasted
    val ref = Flipped(Decoupled(Vec(paral, Bits(W.W)))) // each pe in pe group(1xn PEs) processes one ref
    val dist_k = Input(Bits(W.W))
    val address_i = Input(Bits(W.W)) // From controller
    // these are to pass the signals to topK
    val address_north = Flipped(Decoupled(Bits(W.W))) // From north PE
    val address_south = Decoupled(Bits(W.W)) // To south PE
    val dist_north = Flipped(Decoupled(Bits(W.W)))
    val dist_south = Decoupled(Bits(W.W)) 
    //#######################//
    val skip_to_next = Output(Bool())
    val partial_dist = Output(Bits(W.W)) // test purpose
  })
    val fifo_dist = Module(new Queue(UInt(W.W), entries = N))
    val fifo_addr = Module(new Queue(UInt(W.W), entries = N))
    fifo_addr.enq.valid := false.B
    fifo_dist.enq.valid := false.B
    fifo_dist.enq.bits := DontCare
    fifo_addr.enq.bits := DontCare
    dist_south <> fifo_dist
    address_south <> fifo_addr

    val idle::running::Nil = Enum(2)
    val state = RegInit(idle)
    val dist_north_reg = RegInit(0.U(W.W))//north
    val addr_north_reg = RegInit(0.U(W.W))//north
    val reg_ready_to_enq_north = RegInit(false)
    val addr_PE_reg = RegInit(0.U(W.W)) // this addr
    val reg_ready_to_enq_PE = RegInit(false)
    val counter = RegInit(0.U(5.W))
    val num_cycle = dim / paral
    val acc_dist = RegInit(0.U(W.W))
    /* compute path */
    val substract = VecInit(io.query.zip(io.ref).map { case (a, b) => a - b })
    val square = substract.map(a => RegNext(a * a))
    val tmp = acc_dist + square.reduceTree(_ + _)
    /* end of compute */
    io.partial_dist := tmp // test purpose
    switch(state) {
      is(idle){
        skip_to_next := false.B
        when(io.query.valid && io.ref.valid){
          counter := 0.U
          state := running
          addr_PE_reg := io.address_i //see if need to create a separate signal
        }
        .otherwise{
          counter := 0.U
          state := idle
          addr_PE_reg := addr_PE_reg
        }
      }
      is(running) {
        counter := counter + 1
        addr_PE_reg := addr_PE_reg
        when (tmp > disk_t || counter == num_cycle - 1){
          /* this case prioritize this PE's enq at its last compute cycle */
          fifo_addr.enq.valid := true.B
          fifo_dist.enq.valid := true.B
          fifo_dist.enq.bits := acc_dist
          fifo_addr.enq.bits := addr_PE_reg
          acc_dist := 0.W
          skip_to_next := true.B
        }
        .otherwise{
          // set tmp dist
          acc_dist := tmp
          skip_to_next := false.B
        }
      }
    }
    /*
    enq north when north sends something and this PE is not finishing
    */
    when(reg_ready_to_enq_north && !running && (tmp > disk_t || counter == num_cycle - 1)){
      fifo_addr.enq.valid := true.B
      fifo_dist.enq.valid := true.B
      fifo_dist.enq.bits := dist_north_reg
      fifo_addr.enq.bits := addr_north_reg
    }
    /*
    buffer the input from the north PE
    */
    when(address_north.valid && dist_north.valid){
      addr_north_reg := address_north.bits
      dist_north_reg := dist_north.bits
      reg_ready_to_enq_north := true.B
    }
    .otherwise{
      dist_north_reg := dist_north_reg
      addr_north_reg := addr_north_reg
    }

    /* south bridge dequeue state machine */
}
