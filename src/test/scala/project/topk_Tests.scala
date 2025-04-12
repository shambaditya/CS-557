package project


import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random

class topUnit_Tests extends TestWithBackendSelect with ChiselScalatestTester {
  behavior of "topUnit"

  it should "" in {
    
    test(new topUnit(4,16,1,16)).withAnnotations(simAnnos) { c =>
        //Random.setSeed(42)
        c.io.broadcast_query.valid.poke(false.B)
        for(i <- 0 until 4){
            c.io.refs(i).valid.poke(false.B)
        }
        
        val dim = 32
        val testInputsArray: Array[Seq[(Int, Int)]] = Array.fill(4)(
            Seq.fill(128)((Random.between(-200, 200), Random.between(-200, 200)))
            )
        var dist = 0
        c.clock.step(1)
        var i = 0
        for (t <- 0 until 128) {
        // Enable broadcast query
        c.io.broadcast_query.valid.poke(true.B)

        // Feed each of the 4 ref inputs with their respective test inputs
        for (i <- 0 until 4) {
            val (reference, query) = testInputsArray(i)(t)
            c.io.refs(i).valid.poke(true.B)
            c.io.addrs(i).poke("hbeef".U)
            c.io.refs(i).bits(0).poke(reference.S)

            if (i == 0) {  // Only poke query once (broadcast)
            c.io.broadcast_query.bits(0).poke(query.S)
            }
        }

        c.clock.step(1)

        // Deassert valid and optionally poke again with placeholder
        for (i <- 0 until 4) {
            val (reference, _) = testInputsArray(i)(t)
            c.io.refs(i).valid.poke(false.B)
            c.io.addrs(i).poke("hdead".U)
            c.io.refs(i).bits(0).poke(reference.S)
        }

        c.clock.step(1)
        c.clock.step(1)
        }

        c.clock.step(32)
        println(c.io.addrOut.peek())
    }
  }
}
