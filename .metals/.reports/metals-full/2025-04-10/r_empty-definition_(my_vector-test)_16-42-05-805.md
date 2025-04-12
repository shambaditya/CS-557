error id: chiseltest/package.testableData#poke().
file://<WORKSPACE>/src/test/scala/project/PE_Tests.scala
empty definition using pc, found symbol in pc: 
found definition using semanticdb; symbol chiseltest/package.testableData#poke().
empty definition using fallback
non-local guesses:

offset: 827
uri: file://<WORKSPACE>/src/test/scala/project/PE_Tests.scala
text:
```scala
package project

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random

class PE_Tests extends TestWithBackendSelect with ChiselScalatestTester {
  behavior of "PE_Module"

  it should "" in {
    
    test(new PE_Module).withAnnotations(simAnnos) { c =>
      
        c.io.query.valid.poke(false.B)
        c.io.refs.valid.poke(false.B)
        val dim = 128
        val testInputs : Seq[(Int, Int)] = Seq.fill(dim)((Random.between(-10, 11), Random.between(-10, 11)))

        c.clock.step(1)
        for ((reference, query) <- testInputs) {
          c.io.query.valid.poke(true.B)
          c.io.refs.valid.poke(true.B)
          c.io.address_i.poke("hbeef".U)
          println(VecInit(Seq(query.S)))
          c.io.query.bits(0).poke(query.S)
          c.io.refs.bits.poke@@(VecInit(Seq(reference.S)))
          println(c.io.partial_dist.peek())
          c.clock.step(1)
          
          c.io.query.valid.poke(false.B)
          c.io.refs.valid.poke(false.B)
          c.io.address_i.poke("hdead".U)
          c.io.query.bits.poke(VecInit(Seq(query.S)))
          c.io.refs.bits.poke(VecInit(Seq(reference.S)))
          println(c.io.partial_dist.peek())
          c.clock.step(1)
          println(c.io.partial_dist.peek())
          c.clock.step(1)
          println(c.io.partial_dist.peek())
        }
    }
  }
}

```


#### Short summary: 

empty definition using pc, found symbol in pc: 