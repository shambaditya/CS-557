package proj_topK

import chisel3._
import chisel3.util._


class DistAddr(W: Int, AW: Int) extends Bundle {
  val distance = UInt(W.W)
  val addr     = UInt(AW.W)
}

class KthSmallestTracker(K: Int, W: Int, AW: Int) extends Module {
  val io = IO(new Bundle {
    val in       = Flipped(Decoupled(new DistAddr(W, AW)))
    //finish signal
    val finish   = Input(Bool()) 
    val kthOut   = Decoupled(new DistAddr(W, AW)) 
    val addrOut  = Output(Vec(K, UInt(AW.W)))      
    val addrValid = Output(Bool())                  
  })

 
  val defaultEntry = Wire(new DistAddr(W, AW))
  defaultEntry.distance := (1.U << (W - 1)).asUInt  // High value (acts as "infinity")
  defaultEntry.addr     := 0.U

  
  val heap  = RegInit(VecInit(Seq.fill(K)(defaultEntry)))
  val count = RegInit(0.U(log2Ceil(K+1).W))
  

  def findMax(): (DistAddr, UInt) = {
    heap.zipWithIndex
      .map { case (entry, index) => (entry, index.U) }
      .reduce[(DistAddr, UInt)] { (a, b) =>
        val (entryA, idxA) = a
        val (entryB, idxB) = b
        (Mux(entryB.distance > entryA.distance, entryB, entryA),
         Mux(entryB.distance > entryA.distance, idxB, idxA))
      }
  }


  val (maxEntry, maxIdx) = findMax()
  val currentMax = Wire(new DistAddr(W, AW))
  when(count === 0.U) {
    currentMax := defaultEntry
  } .otherwise {
    val validEntries = Wire(Vec(K, new DistAddr(W, AW)))
    for (i <- 0 until K) {
      validEntries(i) := Mux(i.U < count, heap(i), defaultEntry)
    }
    currentMax := validEntries.reduce((a, b) => Mux(a.distance > b.distance, a, b))
  }
  

  val kthEntry = Mux(count === K.U, maxEntry, currentMax)

  
  when(io.in.valid) {
    when(count < K.U) {
      heap(count) := io.in.bits
      count := count + 1.U
    } .elsewhen(io.in.bits.distance < kthEntry.distance) {
      heap(maxIdx) := io.in.bits
    }
  }

 
  io.kthOut.bits  := kthEntry
  io.kthOut.valid := io.finish
  io.addrValid    := io.finish

  
  io.in.ready := true.B

  
  for(i <- 0 until K) {
    io.addrOut(i) := heap(i).addr
  }
}

//in your PE it seems u used Bits(W.W) while i used UInt both distance and address. We can cast this using asUInt like : kthTracker.io.in.bits.distance := pe.io.partial_dist.asUInt etc 
//The top‑K module uses  Decoupled it expects a valid signal along with a ready handshake.
