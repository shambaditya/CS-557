package project
import chisel3._
import chisel3.util._

class PE_Group(val N: Int, val W: Int, val paral : Int = 1) extends Module {
    val io = IO(new Bundle{
        val broadcast_query = Flipped(Decoupled(Vec(paral, SInt(W.W))))
        val refs = Flipped(Decoupled(Vec(paral * N, SInt(W.W))))
        val addrs = Input(Vec(N, UInt(W.W)))
        val dist_k = Flipped(Decoupled(UInt(W.W)))
        val terminates = Output(Vec(N,Bool())) // handled by topUnit
        val dist_to_topk = Decoupled(SInt(W.W)) // handled by topk
        val addr_to_topk = Decoupled(SInt(W.W)) // handled by topk
    })
    val group = Seq.fill(N)(Module(new PE_Module))
    for (i <- 0 until N) {
        group(i).io.query <> io.broadcast_query
        group(i).io.address_i := io.addrs(i)
        group(i).io.dist_k <> io.dist_k
        group(i).io.refs.bits := io.refs.bits.slice(i * paral, (i+1) * paral)
        group(i).io.refs.valid := io.refs.valid
        io.terminates(i) := group(i).io.skip_to_next
        if (i >= 1) {
            group(i).io.address_north <> group(i - 1).io.address_south
            group(i).io.dist_north <> group(i - 1).io.dist_south
        }
        if (i == N-1){
            io.dist_to_topk <> group(i).io.address_south
            io.addr_to_topk  <> group(i).io.dist_south
        }
    }
}