error id: file://<WORKSPACE>/src/main/scala/withBackendSelect.scala:0
file://<WORKSPACE>/src/main/scala/withBackendSelect.scala
empty definition using pc, found symbol in pc: 
semanticdb not found
empty definition using fallback
non-local guesses:

offset: 7
uri: file://<WORKSPACE>/src/main/scala/withBackendSelect.scala
text:
```scala
package@@ project

import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.{ConfigMap, BeforeAndAfterAllConfigMap}
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

empty definition using pc, found symbol in pc: 