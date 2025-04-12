error id: withAnnotations
file://<WORKSPACE>/src/main/scala/PE_test.scala
empty definition using pc, found symbol in pc: 
semanticdb not found

found definition using fallback; symbol withAnnotations
offset: 241
uri: file://<WORKSPACE>/src/main/scala/PE_test.scala
text:
```scala
package project

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class PE_Tests extends TestWithBackendSelect with ChiselScalatestTester {
  behavior of "PE"

  it should "" in {
    
    test(new PE_Module).w@@ithAnnotations(simAnnos) { c =>
      
        c.io.query.valid.poke(false.B)
        c.io.refs.valid.poke(false.B)
      
        val dim = 128
        val testInputs : Seq[(Int, Int)] = Seq.fill(dim)((Random.between(-10, 11), Random.between(-10, 11)))

     
        for ((refence, query) <- testInputs) {
        
        }
    }
  }
}

```


#### Short summary: 

empty definition using pc, found symbol in pc: 