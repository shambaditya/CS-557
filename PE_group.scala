package project


class PE_Group(val N: Uint, val W: Uint, val paral : UInt = 1) extends Module {
    val io = IO(new Bundle{
        val broadcast_query = Input(Vec(paral, Bits(W.W)))
        val refs = Input(Vec(paral * N, Bits(W.W)))
        val addrs = Input(Vec(N, Bits(W.W)))
        val terminates = Output(Vec(N,Bool()))
        
    })
    val group = Seq.fill(N)(Module(new PE_Module))
    for (i <- 0 until N) {
        group(i).io.query := broadcast_query
        group(i).io.address_i := io.addrs(i)
        group(i).io.ref := refs.slice(i * paral, (i+1) * paral)
        if (i >= 1) {
            group(i).io.address_north <> group(i - 1).io.address_south
            group(i).io.dist_north <> group(i - 1).io.dist_north
        }
    }
}