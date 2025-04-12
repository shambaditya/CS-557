error id: project/integration#idle.
file://<WORKSPACE>/src/main/scala/integration.scala
empty definition using pc, found symbol in pc: 
found definition using semanticdb; symbol project/integration#idle.
empty definition using fallback
non-local guesses:

offset: 716
uri: file://<WORKSPACE>/src/main/scala/integration.scala
text:
```scala
package project
import chisel3._
import chisel3.util._
import chipsalliance.rocketchip.config._
import beethoven._
import beethoven.common._


class integration(implicit p: Parameters) extends AcceleratorCore {
    val io = BeethovenIO(
        new AccelCommand("project") {
            val data_addr = Vec(16, Address())
        },
        EmptyAccelResponse()
    )

    val acc = Module(new topUnit(4,16,1,16)) // N,W,paral,K
    val (req_channels, dat_channels) = getReaderModules("vec_streams")
    val rc_ptrs = RegInit(VecInit(Seq.fill(4)(0.U(3.W))))
    val idle::sent::running::flushing::Nil = Enum(4)
    val states = RegInit(VecInit(Seq.fill(4)(idle)))
    val read_ctrs = RegInit(VecInit(Seq.fill(4)(idle@@)))
    var idx = 0
    for(i <- 0 until 16){
        switch(states(i)){
            is(idle){
                // all send request
                // only
                when(req_channels(i).ready)
                {
                    req_channels(i).valid := true.B
                    req_channels(i).bits.len := 256.U //2 bytes * 128 dims
                    states(i) := sent
                }
            }
            is(sent){
                // sent channel with id counter move to running
                val group_id = i / 4
                val pe_offset = rc_ptrs(group_id)
                when(i.U === (group_id * 4).U + pe_offset){
                    states(i) := running
                }
            }
            is(running){
                // send valid data to PE until terminate
                // go to flush if needs to
                // move to the next request if finished
                when(dat_channels(i).data.valid){

                }
            }
            is(flushing){
                // flush the data
                // move to the next request if finished
            }
        }
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: 