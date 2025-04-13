package project
import chisel3._
import chisel3.util._
import chipsalliance.rocketchip.config._
import beethoven._
import beethoven.common._


class integration(implicit p: Parameters) extends AcceleratorCore {
    val io = BeethovenIO(
        new AccelCommand("project") {
            val data_addr = Address()
            val query_addr = Address()
            val num_byte = UInt(64.W)
        },
        EmptyAccelResponse()
    )
    
    val acc = Module(new topUnit(4,16,1,16)) // N,W,paral,K
    val (req_channels, dat_channels) = getReaderModules("data_in")// make sure that the channel has width === paral
    val ReaderModuleChannel(query_in_request, query_in) = getReaderModule("query_in")
    val activeCmd = RegInit(false.B)
    when (io.req.fire)
    {
        activeCmd := true.B
    }
    // val query_sp = getScratchpad("query_in")
    // val sp_mem_req = query_sp.requestChannel    
    // val sp_data_port = query_sp.dataChannels
    val idle::sent::running::flushing::Nil = Enum(4)
    val query_states = RegInit(idle)
    val query_ctrs = RegInit(0.U(10.W))
    val rc_ptrs = RegInit(VecInit(Seq.fill(4)(0.U(3.W))))
    
    val states = RegInit(VecInit(Seq.fill(12)(idle)))

    // val query_Reg = RegInit(VecInit(Seq.fill(4)(0.S(16.W))))
    val query_Reg_valid = RegInit(VecInit(Seq.fill(128)(false.B)))
    val query_Reg = RegInit(VecInit(Seq.fill(128)(0.S(16.W))))
    val read_ctrs = RegInit(VecInit(Seq.fill(12)(0.U(10.W))))

    val addrs = Reg(Vec(12, Address()))
    val end_addr = Reg(Vec(12, Address()))
    val finish = RegInit(VecInit(Seq.fill(12)(false.B)))
// Example: latch input on a condition (e.g., load signal)
    for (i <- 0 until 8) { // 16
        addrs(i) := io.req.bits.data_addr + i.U * io.req.bits.num_byte
        end_addr(i) := io.req.bits.data_addr + (i.U + 1.U) * io.req.bits.num_byte
    }
    acc.io.finish := finish.reduce(_ && _)
    query_in_request.valid := false.B
    query_in_request.bits.addr := DontCare
    query_in_request.bits.len := DontCare
    query_in.data.ready := true.B
    switch(query_states){
        is(idle){
            query_in_request.valid := true.B
            query_in_request.bits.addr := io.req.bits.query_addr
            query_in_request.bits.len := 256.U //2 bytes * 128 dims
            query_states := sent
        }
        is(sent){
            query_states := sent
            when(query_in.data.valid && query_ctrs < 128.U){
                query_Reg(query_ctrs) := query_in.data.bits.asSInt
                query_Reg_valid(query_ctrs) := true.B
                query_ctrs := query_ctrs + 1.U
            }
        }
    }    
    /*init the Scratchpad*/
    // switch(scratchpad_states){
    //     is(idle){
    //         sp_mem_req.init.bits.memAddr := io.req.bits.query_addr
    //         sp_mem_req.init.bits.len := 256.U
    //         sp_mem_req.init.valid := true.B
    //         scratchpad_states := sent
    //     }
    //     is(sent){
    //         for(i <- 0 until 4)
    //         {
    //             when(sp_mem_req.init.ready && sp_data_port(i).req.ready){
    //                 sp_data_port(i).req.bits.addr := 0.U
    //                 sp_data_port(i).req.valid := true.B
    //                 scratchpad_states := sent
    //             }.elsewhen(sp_data_port(i).res.valid){
    //                 query_Reg(i) := sp_data_port(i).res.bits.asSInt //UINT?
    //                 query_Reg_valid(i) := true.B
    //                 scratchpad_states := running
    //             }
    //         }
    //     }
    //     is(running){
    //         for(i <- 0 until 4){
    //             when(acc.io.terminates(i)){
    //                 //prefetch the next
    //                 sp_data_port(i).req.bits.addr := 0.U
    //                 sp_data_port(i).req.valid := true.B
    //                 scratchpad_states := sent
    //             }.elsewhen(sp_data_port(i).res.valid){
    //                 query_Reg(i) := sp_data_port(i).res.bits.asSInt //UINT?
    //                 query_Reg_valid(i) := true.B
    //                 scratchpad_states := running
    //             }
    //         }
    //     }
    // }

    for(i <- 0 until 8){
        val group_id = i / 2
        req_channels(i).valid := false.B
        req_channels(i).bits.addr := DontCare
        req_channels(i).bits.len := DontCare
        dat_channels(i).data.ready := false.B
        acc.io.addrs(group_id) := DontCare
        acc.io.refs(group_id).valid := false.B
        acc.io.refs(group_id).bits := DontCare
        acc.io.broadcast_query.valid := false.B
        acc.io.broadcast_query.bits := DontCare
        switch(states(i)){
            is(idle){
                // all send request
                // only
                when(req_channels(i).ready && addrs(i) < end_addr(i))
                {
                    req_channels(i).valid := true.B
                    req_channels(i).bits.addr := addrs(i)
                    req_channels(i).bits.len := 256.U //2 bytes * 128 dims
                    states(i) := sent
                }
                .elsewhen(addrs(i) >= end_addr(i)){
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
                when(dat_channels(i).data.valid && read_ctrs(i) < 127.U && query_Reg_valid(read_ctrs(i))){ //&& sp_data_port(group_id).req.ready
                    // put ready high when scratchpad is ready
                    /**Ref**/
                    dat_channels(i).data.ready := true.B
                    acc.io.refs(group_id).bits := VecInit(dat_channels(i).data.bits.asSInt)
                    acc.io.refs(group_id).valid := dat_channels(i).data.valid
                    acc.io.addrs(group_id) := addrs(i).asUInt
                    /**QUERY**/
                    acc.io.broadcast_query.bits := VecInit(query_Reg(read_ctrs(i))) // get the data from the corresponding port (no conflict)
                    acc.io.broadcast_query.valid := true.B
                    query_Reg_valid(group_id) := false.B // consumed
                    // sp_data_port(group_id).req.bits.addr := read_ctrs(i) + 1.U // prefetch from the next
                    // sp_data_port(group_id).req.valid := true.B
                    /****/
                    read_ctrs(i) := read_ctrs(i) + 1.U // INCREMENT COUNTER
                    states(i) := running
                }
                .elsewhen(dat_channels(i).data.valid && read_ctrs(i) === 127.U){
                    dat_channels(i).data.ready := true.B
                    acc.io.refs(group_id).bits := VecInit(dat_channels(i).data.bits.asSInt)
                    acc.io.refs(group_id).valid := true.B
                    read_ctrs(i) := 0.U
                    states(i) := idle
                    rc_ptrs(group_id) := Mux(rc_ptrs(group_id) === 3.U, 0.U, rc_ptrs(group_id) + 1.U) // query sp renewed in another state machine
                }
                .elsewhen(read_ctrs(i) < 127.U && acc.io.terminates(group_id)){
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

    io.req.ready := !activeCmd
    io.resp.valid := acc.io.finish
}