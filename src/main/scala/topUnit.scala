package project
import chisel3._
import chisel3.util._

class topUnit(val N: Int, val W: Int, val paral : Int = 1, val K : Int = 16) extends Module {
    val io = IO(new Bundle{
        val broadcast_query = Flipped(Decoupled(Vec(paral, SInt(W.W))))
        val refs = Vec(N, Flipped(Decoupled(Vec(paral, SInt(W.W)))))
        val addrs = Input(Vec(N, UInt(64.W)))
        val finish = Input(Bool())
        val terminates = Output(Vec(N,Bool())) // handled by topUnit
        val addrOut = Output(Vec(K, UInt(64.W)))
        val addrValid = Output(Bool())
    })
    val topk_unit = Module(new KthSmallestTracker(K, W, 64))
    topk_unit.io.finish := io.finish
    io.addrOut := topk_unit.io.addrOut
    io.addrValid := topk_unit.io.addrValid
    val group = Seq.fill(N)(Module(new PE_Module))
    for (i <- 0 until N) {
        if(i == 0){
            group(i).io.dist_north := DontCare
            group(i).io.address_north := DontCare
        }
        group(i).io.query <> io.broadcast_query
        group(i).io.address_i := io.addrs(i)
        group(i).io.dist_k <> topk_unit.io.kthOut
        group(i).io.refs <> io.refs(i)
        io.terminates(i) := group(i).io.skip_to_next
        if (i >= 1) {
            group(i).io.address_north <> group(i - 1).io.address_south
            group(i).io.dist_north <> group(i - 1).io.dist_south
        }
        if (i == N-1){
            topk_unit.io.in.bits.addr := group(i).io.address_south.bits
            topk_unit.io.in.bits.distance  := group(i).io.dist_south.bits
            topk_unit.io.in.valid := group(i).io.address_south.valid && group(i).io.dist_south.valid
            group(i).io.address_south.ready := topk_unit.io.in.ready 
            group(i).io.dist_south.ready := topk_unit.io.in.ready 
        }
    }

}