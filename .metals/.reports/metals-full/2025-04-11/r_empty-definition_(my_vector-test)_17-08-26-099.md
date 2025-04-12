error id: chisel3/package.fromBooleanToLiteral#B().
file://<WORKSPACE>/src/test/scala/project/topk_Tests.scala
empty definition using pc, found symbol in pc: 
found definition using semanticdb; symbol chisel3/package.fromBooleanToLiteral#B().
empty definition using fallback
non-local guesses:

offset: 461
uri: file://<WORKSPACE>/src/test/scala/project/topk_Tests.scala
text:
```scala
package project


import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random

class topUnit_Tests extends TestWithBackendSelect with ChiselScalatestTester {
  behavior of "topUnit"

  it should "" in {
    
    test(new topUnit(4,16,1,16)).withAnnotations(simAnnos) { c =>
        Random.setSeed(42)
        c.io.broadcast_query.valid.poke(false.B)
        for(i < 0 until 4){
            c.io.refs.valid.poke(false.@@B)
        }
        
        c.io.dist_south.ready.poke(true.B)
        val dim = 128
        val testInputs : Seq[(Int, Int)] = Seq.fill(dim)((Random.between(-10, 11), Random.between(-10, 11)))
        var dist = 0
        c.clock.step(1)
        var i = 0
        for ((reference, query) <- testInputs) {

          dist = dist + (reference - query) * (reference - query)
          //println(dist)
          c.io.query.valid.poke(true.B)
          c.io.refs.valid.poke(true.B)
          c.io.address_i.poke("hbeef".U)
          c.io.query.bits(0).poke(query.S)
          c.io.refs.bits(0).poke(reference.S)
          println(c.io.dist_south.bits.peek())
            
          c.clock.step(1)
          
          c.io.query.valid.poke(false.B)
          c.io.refs.valid.poke(false.B)
          c.io.address_i.poke("hdead".U)
          c.io.query.bits(0).poke(query.S)
          c.io.refs.bits(0).poke(reference.S)
          println(c.io.dist_south.bits.peek())
          //println(c.io.partial_dist.peek())
          
          c.clock.step(1)
          println(c.io.dist_south.bits.peek())
          c.clock.step(1)
          i = i+1
          if ((i)%32 == 0){
            dist = 0
          }
        }
    }
  }
}

```


#### Short summary: 

empty definition using pc, found symbol in pc: 