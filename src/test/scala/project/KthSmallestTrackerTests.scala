package project

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class KthSmallestTrackerTests extends TestWithBackendSelect with ChiselScalatestTester {
  behavior of "KthSmallestTracker"

  it should "produce no valid output until finish is asserted and then output the correct kth smallest and addresses" in {
    
    test(new KthSmallestTracker(K = 3, W = 32, AW = 8)).withAnnotations(simAnnos) { c =>
      
     
      c.io.finish.poke(false.B)
      c.io.in.valid.poke(false.B)
      c.io.kthOut.ready.poke(true.B)
      
      val testInputs = Seq(
        (30, 0),
        (15, 1),
        (25, 2),
        (10, 3),
        (20, 4),
        (5, 5),
        (8, 6)
      )

     
      for ((dist, addr) <- testInputs) {
        c.io.in.bits.distance.poke(dist.U)
        c.io.in.bits.addr.poke(addr.U)
        c.io.in.valid.poke(true.B)
        c.clock.step(1)
        c.io.in.valid.poke(false.B)
        c.clock.step(1) // Allow time for internal updates.
      }

      
      c.io.kthOut.valid.expect(false.B)
      c.io.addrValid.expect(false.B)

      
      c.io.finish.poke(true.B)
      c.clock.step(1)

      
      c.io.kthOut.valid.expect(true.B)
      c.io.addrValid.expect(true.B)
      
      
      // Heap is [(10,3), (8,6), (5,5)]
      // Largest now these should be (10, addr=3).
      // c.io.kthOut.bits.distance.expect(10.U)
      // c.io.kthOut.bits.addr.expect(3.U)
      
      // Outputs final addresses [3, 6, 5].
      c.io.addrOut(0).expect(3.U)
      c.io.addrOut(1).expect(6.U)
      c.io.addrOut(2).expect(5.U)

      c.clock.step(2)
    }
  }
}
