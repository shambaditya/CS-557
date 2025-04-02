package proj_topK

import chisel3._
import chisel3.util._

class KthSmallestTracker(K: Int, W: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(UInt(W.W))) 
    val out = Decoupled(UInt(W.W))          
  })

  
  val heap = RegInit(VecInit(Seq.fill(K)((1.U << (W - 1)).asUInt)))
  val count = RegInit(0.U(log2Ceil(K+1).W))
  val valid = RegInit(false.B)

  
  def findMax(): (UInt, UInt) = {
    heap.zipWithIndex
      .map { case (value, index) => (value, index.U) }
      .reduce[(UInt, UInt)] { (a, b) =>
        val (maxV, maxI) = a
        val (curV, curI) = b
        (Mux(curV > maxV, curV, maxV), Mux(curV > maxV, curI, maxI))
      }
  }

  
  val findMaxVal = Mux(count < K.U, 0.U(W.W), findMax()._1)
  val findMaxIdx = Mux(count < K.U, 0.U(log2Ceil(K).W), findMax()._2)

  when(io.in.valid) {
    when(count < K.U) {
      heap(count) := io.in.bits
      count := count + 1.U
    }.elsewhen(io.in.bits < findMaxVal) {
      heap(findMaxIdx) := io.in.bits
    }

    valid := true.B
  }.elsewhen(io.out.ready && io.out.valid) {
    valid := false.B
  }

  
  io.out.bits := Mux(count === K.U, findMaxVal, heap(0))
  io.out.valid := valid
  io.in.ready := true.B
}
