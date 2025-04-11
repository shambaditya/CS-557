// Chisel highlighting

// package project
// import chisel3._
// import chisel3.util._
// import beethoven._
// import beethoven.common._


// class TopUnit(implicit p: Parameters) extends AcceleratorCore {
//     val io = BeethovenIO(
//         new AccelCommand("project") {
//         },
//         EmptyAccelResponse()
//     )

//     val col = Module(new PE_Group(1,16,4))
//     val (req_channels, dat_channels) = getReaderModules("vec_streams")
//     val topK = Module(new KthSmallestTracker(16,16,16))
//     topK.io.in.bits.distance := col.io.dist_to_topk
//     topK.io.in.bits.addr := col.io.addr_to_topk
//     col.io.dist_k <> topK.io.kthOut
//     col.io.terminates // all PE's terminate signal, if high flush, and fetch another one
//     col.io.addrs 
//     col.io.refs  // n of them
//     col.io.broadcast_query // only one
// }