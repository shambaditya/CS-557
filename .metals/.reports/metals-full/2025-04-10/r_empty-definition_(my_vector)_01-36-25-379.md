error id: org/scalatest/ConfigMap.
file://<WORKSPACE>/src/main/scala/withBackendSelect.scala
empty definition using pc, found symbol in pc: org/scalatest/ConfigMap.
semanticdb not found
empty definition using fallback
non-local guesses:
	 -org/scalatest/ConfigMap.
	 -org/scalatest/ConfigMap#
	 -org/scalatest/ConfigMap().
	 -chiseltest/ConfigMap.
	 -chiseltest/ConfigMap#
	 -chiseltest/ConfigMap().
	 -ConfigMap.
	 -ConfigMap#
	 -ConfigMap().
	 -scala/Predef.ConfigMap.
	 -scala/Predef.ConfigMap#
	 -scala/Predef.ConfigMap().
offset: 87
uri: file://<WORKSPACE>/src/main/scala/withBackendSelect.scala
text:
```scala
package project

import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.{Config@@Map, BeforeAndAfterAllConfigMap}
import firrtl.AnnotationSeq
import chiseltest._

abstract class TestWithBackendSelect
    extends AnyFlatSpec
    with BeforeAndAfterAllConfigMap {
  var backend = ""
  /***** simulate using tradle (default) *****/
//  var simAnnos: AnnotationSeq = Seq()
  /***** use verilator simulator *****/
//   val simAnnos = Seq(VerilatorBackendAnnotation) ++ Seq(WriteVcdAnnotation)
  /***** use VCS *****/
   val simAnnos = Seq(VcsBackendAnnotation) ++ Seq(WriteVcdAnnotation)
  /***** use icarus *****/
  // val simAnnos = Seq(IcarusBackendAnnotation) ++ Seq(WriteVcdAnnotation)
}

```


#### Short summary: 

empty definition using pc, found symbol in pc: org/scalatest/ConfigMap.