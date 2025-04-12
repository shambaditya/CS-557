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
            val end_addr = Vec(16, Address())
        },
        EmptyAccelResponse()
    )
    
    val acc = Module(new topUnit(4,16,1,16)) // N,W,paral,K
    val (req_channels, dat_channels) = getReaderModules("vec_streams")// make sure that the channel has width === paral
    val rc_ptrs = RegInit(VecInit(Seq.fill(4)(0.U(3.W))))
    val idle::sent::running::flushing::Nil = Enum(4)
    val states = RegInit(VecInit(Seq.fill(4)(idle)))
    val read_ctrs = RegInit(VecInit(Seq.fill(16)(0.U(10.W))))
    val addrs = Reg(Vec(16, Address()))
    val finish = RegInit(VecInit(Seq.fill(16)(false.B)))
// Example: latch input on a condition (e.g., load signal)
    for (i <- 0 until 16) {
        addrs(i) := io.req.bits.data_addr(i)
    }
    acc.io.finish := finish.reduce(_ && _)
    for(i <- 0 until 16){
        val group_id = i / 4
        switch(states(i)){
            is(idle){
                // all send request
                // only
                when(req_channels(i).ready && addrs(i) < io.req.bits.end_addr(i))
                {
                    req_channels(i).valid := true.B
                    req_channels(i).bits.addr := addrs(i)
                    req_channels(i).bits.len := 256.U //2 bytes * 128 dims
                    states(i) := sent
                }
                .elsewhen(addrs(i) === io.req.bits.end_addr(i)){
                    finish(i) := true.B
                    states(i) := idle
                }
            }
            is(sent){
                // sent channel with id counter move to running

                val pe_offset = rc_ptrs(group_id)
                when(i.U === (group_id * 4).U + pe_offset){
                    states(i) := running
                }
            }
            is(running){
                // send valid data to PE until terminate
                // go to flush if needs to
                // move to the next request if finished
                // counter 
                when(dat_channels(i).data.valid && read_ctrs(i) < 127.U){
                    dat_channels(i).data.ready := true.B
                    acc.io.refs(group_id).bits := dat_channels(i).data.bits
                    acc.io.refs(group_id).valid := dat_channels(i).data.valid
                    read_ctrs(i) := read_ctrs(i) + 1.U
                    states(i) := running
                }
                .elsewhen(dat_channels(i).data.valid && read_ctrs(i) === 127.U){
                    dat_channels(i).data.ready := true.B
                    acc.io.refs(group_id).bits := dat_channels(i).data.bits
                    acc.io.refs(group_id).valid := true.B
                    read_ctrs(i) := 0.U
                    states(i) := idle
                    rc_ptrs(group_id) := Mux(rc_ptrs(group_id) === 3.U, 0.U, rc_ptrs(group_id) + 1.U)
                }
                .elsewhen(read_ctrs(i) < 127.U && acc.io.terminates(i)){
                    acc.io.refs(group_id).valid := false.B
                    states(i) := flushing
                    rc_ptrs(group_id) := Mux(rc_ptrs(group_id) === 3.U, 0.U, rc_ptrs(group_id) + 1.U)
                }
            }
            is(flushing){
                // flush the data
                // move to the next request if finished
                when(dat_channels(i).data.valid && read_ctrs(i) < 127.U){
                    dat_channels(i).data.ready := true.B
                    read_ctrs(i) := read_ctrs(i) + 1.U
                    states(i) := flushing
                }
                .elsewhen(read_ctrs(i) === 127.U){
                    addrs(i) := addrs(i) + 256.U
                    states(i) := idle
                }
            }
        }
    }
}