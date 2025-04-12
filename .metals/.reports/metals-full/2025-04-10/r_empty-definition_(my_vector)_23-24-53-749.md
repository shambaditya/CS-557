error id: local6
file://<WORKSPACE>/src/main/scala/PE_group.scala
empty definition using pc, found symbol in pc: local6
empty definition using semanticdb

found definition using fallback; symbol address_south
offset: 1394
uri: file://<WORKSPACE>/src/main/scala/PE_group.scala
text:
```scala
package project
import chisel3._
import chisel3.util._

class PE_Group(val N: Int, val W: Int, val paral : Int = 1, val K : Int = 16) extends Module {
    val io = IO(new Bundle{
        val broadcast_query = Flipped(Decoupled(Vec(paral, SInt(W.W))))
        val refs = Flipped(Decoupled(Vec(paral * N, SInt(W.W))))
        val addrs = Input(Vec(N, UInt(W.W)))
        val fnish = Input(Bool())
        val terminates = Output(Vec(N,Bool())) // handled by topUnit
        val addrOut = Output(Vec(K, UInt(W.W)))
        val addrValid = Output(Bool())
    })
    val topk_unit = Module(new KthSmallestTracker(K, W, W))
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
            topk_unit.io.in.bits.addr := group(i).io.address_south.bits
            topk_unit.io.in.bits.distance  := group(i).io.dist_south.bits
            topk_unit.io.in.valid := group(i).io.@@address_south.valid
        }
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: local6