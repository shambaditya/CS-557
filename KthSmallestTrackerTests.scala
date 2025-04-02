package proj_topK

import chiseltest._
import chisel3._
import org.scalatest.flatspec.AnyFlatSpec
// import sha3.TestWithBackendSelect

class KthSmallestTrackerTests extends TestWithBackendSelect with ChiselScalatestTester {
  behavior of "KthSmallestTracker"

  it should "find the K-th smallest distance correctly" in {
    test(new KthSmallestTracker(K = 3, W = 32)).withAnnotations(simAnnos) { c =>
      val test_distances = Seq(30, 15, 25, 10, 20, 5, 8)
      val expected_kth_smallest = Seq(30, 30, 30, 25, 20, 15, 10) // Expected output per cycle
      var timeout = 100

      c.io.in.valid.poke(0)
      c.io.out.ready.poke(1)

      // Feed test distances into the module
      for ((dist, expected) <- test_distances.zip(expected_kth_smallest)) {
        println(s"Poking input distance: $dist") // Fix: Corrected string interpolation

        c.io.in.bits.poke(dist.U(32.W))
        c.io.in.valid.poke(1)
        c.clock.step(1)
        c.io.in.valid.poke(0)

        // Wait for output to be valid
        timeout = 100
        while (c.io.out.valid.peekBoolean() == false && timeout > 0) {
          c.clock.step(1)
          timeout -= 1
        }

        assert(timeout > 0, "FAIL - KthSmallestTracker test timed out.")

        val output = c.io.out.bits.peek().litValue
        println(s"Output K-th smallest: $output (Expected: $expected)") // Fix: Corrected interpolation

        c.io.out.bits.expect(expected.U(32.W))
      }

      println("KthSmallestTracker test PASSED.")
    }
  }
}
