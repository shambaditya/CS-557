error id: 
file://<WORKSPACE>/src/test/scala/project/PE_Tests.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb

found definition using fallback; symbol B
offset: 890
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
          c.io.address_i.poke()
          c.io.query.bits.poke(query)
          c.io.refs.bits.poke(reference)
          c.clock.step(1)

          c.io.query.valid.poke(false.B)
          c.io.refs.valid.poke(false.B@@)
          c.io.address_i.poke()
          c.io.query.bits.poke(query)
          c.io.refs.bits.poke()
          c.clock.step(2)
        }
    }
  }
}

```


#### Short summary: 

empty definition using pc, found symbol in pc: 