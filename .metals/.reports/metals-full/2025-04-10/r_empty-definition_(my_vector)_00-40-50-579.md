error id: file://<WORKSPACE>/src/main/scala/PE.scala:88
file://<WORKSPACE>/src/main/scala/PE.scala
empty definition using pc, found symbol in pc: 
semanticdb not found
empty definition using fallback
non-local guesses:

offset: 3119
uri: file://<WORKSPACE>/src/main/scala/PE.scala
text:
```scala
package project

import chisel3._
import chisel3.util._

//lagom

class PE_Module(val dim : 128, val paral : 1, val W: 16) extends Module {
  val io = IO(new Bundle {
    val query = Flipped(Decoupled(Vec(paral, SInt(W.W)))) // broadcasted
    val refs = Flipped(Decoupled(Vec(paral, SInt(W.W)))) // each pe in pe group(1xn PEs) processes one ref
    val dist_k = Flipped(Decoupled(SInt(W.W)))
    val address_i = Input(UInt(W.W)) // From controller
    // these are to pass the signals to topK
    val address_north = Flipped(Decoupled(UInt(W.W))) // From north PE
    val address_south = Decoupled(UInt(W.W)) // To south PE
    val dist_north = Flipped(Decoupled(SInt(W.W)))
    val dist_south = Decoupled(SInt(W.W)) 
    //#######################//
    val skip_to_next = Output(Bool())
    val partial_dist = Output(SInt(W.W)) // test purpose
  })
    val fifo_dist = Module(new Queue(SInt(W.W), entries = 4))
    val fifo_addr = Module(new Queue(UInt(W.W), entries = 4))
    fifo_addr.io.enq.valid := false.B
    fifo_dist.io.enq.valid := false.B
    fifo_dist.io.enq.bits := DontCare
    fifo_addr.io.enq.bits := DontCare
    io.dist_south <> fifo_dist.io.deq
    io.address_south <> fifo_addr.io.deq

    val idle::running::Nil = Enum(2)
    val state = RegInit(idle)
    val dist_in_topk = RegInit(32767.S(16.W))
    val dist_north_reg = RegInit(0.U(W.W))//north
    val addr_north_reg = RegInit(0.U(W.W))//north
    val reg_ready_to_enq_north = RegInit(false.B)
    val addr_PE_reg = RegInit(0.U(W.W)) // this addr
    val reg_ready_to_enq_PE = RegInit(false.B)
    val counter = RegInit(0.U(5.W))
    val num_cycle = dim / paral
    val acc_dist = RegInit(0.S(W.W))
    /* compute path */
    val substract = VecInit(io.query.bits.zip(io.refs.bits).map { case (a, b) => a - b })
    val square = VecInit(substract.map(a => RegNext(a * a)))
    val tmp = if(paral > 1){
      acc_dist + square.reduceTree(_ + _)
    }
    else{
      acc_dist + square.head
    }
    val compute_valid = RegNext(io.refs.valid)
    /* end of compute */
    io.partial_dist := tmp // test purpose
    switch(state) {
      is(idle){
        io.skip_to_next := false.B
        when(io.query.valid && io.refs.valid){ // && io.address_i.valid
          counter := 0.U
          state := running
          addr_PE_reg := io.address_i
        }
        .otherwise{
          counter := 0.U
          state := idle
          addr_PE_reg := addr_PE_reg
        }
      }
      is(running) {
        counter := counter + 1.U
        addr_PE_reg := addr_PE_reg
        when (tmp > dist_in_topk || counter == num_cycle - 1){
          /* this case prioritize this PE's enq at its last compute cycle */
          fifo_addr.io.enq.valid := true.B
          fifo_dist.io.enq.valid := true.B
          fifo_dist.io.enq.bits := acc_dist
          fifo_addr.io.enq.bits := addr_PE_reg
          acc_dist := 0.S
          io.skip_to_next := true.B
        }
        .elsewhen(compute_valid){
          // set tmp dist
          acc_dist := tmp
          io.skip_to_next := false.B
        }
      }
    }
    /*
    enq north when north sends som@@ething and this PE is not finishing
    */
    when(io.dist_k.valid){
      dist_in_topk := io.dist_k.bits
    }
    when(reg_ready_to_enq_north && !running && (tmp > dist_in_topk || counter == num_cycle - 1)){
      fifo_addr.io.enq.valid := true.B
      fifo_dist.io.enq.valid := true.B
      fifo_dist.io.enq.bits := dist_north_reg
      fifo_addr.io.enq.bits := addr_north_reg
    }
    /*
    buffer the input from the north PE
    */
    when(io.address_north.valid && io.dist_north.valid){
      addr_north_reg := io.address_north.bits
      dist_north_reg := io.dist_north.bits
      reg_ready_to_enq_north := true.B
    }
    .otherwise{
      dist_north_reg := dist_north_reg
      addr_north_reg := addr_north_reg
    }

    /* south bridge dequeue state machine */
    io.address_south <> fifo_addr.io.deq
    io.dist_south <> fifo_dist.io.deq
}

```


#### Short summary: 

empty definition using pc, found symbol in pc: 