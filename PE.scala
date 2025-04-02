package project

import chisel3._

class PE_Module(val paral : Int = 1, val W: Int = 64) extends Module {
  val io = IO(new Bundle {
    val query = Input(Vec(paral, Bits(W.W)))
    val ref = Input(Vec(paral, Bits(W.W)))
    val dist_k = Input(Bits(W.W))
    val address_i = Input(Bits(W.W)) // From controller
    val address_north = Input(Bits(W.W)) // From north PE
    val address_south = Output(Bits(W.W)) // To south PE
    val skip_to_next = Output(Bool())
    val partial_dist = Output(Bits(W.W))
  })

    val acc_dist = RegInit(0.U(W.W))
    val substract = VecInit(io.query.zip(io.ref).map { case (a, b) => a - b })
    val square = substract.map(a => RegNext(a * a))
    val tmp = acc_dist + square.reduceTree(_ + _)
    io.partial_dist := acc_dist // how many registers will this be translated to??
    when (tmp > disk_t){
      acc_dist := 0.W
      skip_to_next := true.B
    }
    otherwise{
      acc_dist := tmp
      skip_to_next := false.B
    }
}
