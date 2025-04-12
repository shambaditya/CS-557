file://<WORKSPACE>/src/main/scala/topUnit.scala
### java.lang.StringIndexOutOfBoundsException: offset 285, count -9, length 1600

occurred in the presentation compiler.

presentation compiler configuration:
Scala version: 2.13.10
Classpath:
<WORKSPACE>/.bloop/my_vector/bloop-bsp-clients-classes/classes-Metals-C6irq1iHTFettGf30PekTw== [exists ], <HOME>/.cache/bloop/semanticdb/com.sourcegraph.semanticdb-javac.0.10.4/semanticdb-javac-0.10.4.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-library/2.13.10/scala-library-2.13.10.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/chisel3_2.13/3.5.6/chisel3_2.13-3.5.6.jar [exists ], <HOME>/.cache/coursier/v1/http/54.165.244.214%3A8080/releases/edu/duke/cs/apex/beethoven-hardware_2.13/0.0.13/beethoven-hardware_2.13-0.0.13.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/chisel3-macros_2.13/3.5.6/chisel3-macros_2.13-3.5.6.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/chisel3-core_2.13/3.5.6/chisel3-core_2.13-3.5.6.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-reflect/2.13.10/scala-reflect-2.13.10.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/os-lib_2.13/0.8.0/os-lib_2.13-0.8.0.jar [exists ], <HOME>/.cache/coursier/v1/http/54.165.244.214%3A8080/releases/edu/duke/cs/apex/rocketchip-rocketchip-fork_2.13/0.1.12/rocketchip-rocketchip-fork_2.13-0.1.12.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatra/scalate/scalate-core_2.13/1.9.6/scalate-core_2.13-1.9.6.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/slf4j/slf4j-api/2.0.9/slf4j-api-2.0.9.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/chiseltest_2.13/0.5.2/chiseltest_2.13-0.5.2.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/firrtl_2.13/1.5.6/firrtl_2.13-1.5.6.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/geny_2.13/0.7.0/geny_2.13-0.7.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-jackson_2.13/3.6.6/json4s-jackson_2.13-3.6.6.jar [exists ], <HOME>/.cache/coursier/v1/http/54.165.244.214%3A8080/releases/edu/duke/cs/apex/rocketchip-cde-fork_2.13/0.1.4/rocketchip-cde-fork_2.13-0.1.4.jar [exists ], <HOME>/.cache/coursier/v1/http/54.165.244.214%3A8080/releases/edu/duke/cs/apex/rocketchip-macros-fork_2.13/0.1.0/rocketchip-macros-fork_2.13-0.1.0.jar [exists ], <HOME>/.cache/coursier/v1/http/54.165.244.214%3A8080/releases/edu/duke/cs/apex/rocketchip-hardfloat-fork_2.13/0.1.0/rocketchip-hardfloat-fork_2.13-0.1.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-compiler/2.13.10/scala-compiler-2.13.10.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatra/scalate/scalate-util_2.13/1.9.6/scalate-util_2.13-1.9.6.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/treadle_2.13/1.5.2/treadle_2.13-1.5.2.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest_2.13/3.1.4/scalatest_2.13-3.1.4.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/utest_2.13/0.7.9/utest_2.13-0.7.9.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/net/java/dev/jna/jna/5.10.0/jna-5.10.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/antlr/antlr4-runtime/4.9.3/antlr4-runtime-4.9.3.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/google/protobuf/protobuf-java/3.18.2/protobuf-java-3.18.2.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/github/scopt/scopt_2.13/3.7.1/scopt_2.13-3.7.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/net/jcazevedo/moultingyaml_2.13/0.4.2/moultingyaml_2.13-0.4.2.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-native_2.13/3.6.12/json4s-native_2.13-3.6.12.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/apache/commons/commons-text/1.9/commons-text-1.9.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/io/github/alexarchambault/data-class_2.13/0.2.5/data-class_2.13-0.2.5.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/modules/scala-parallel-collections_2.13/1.0.4/scala-parallel-collections_2.13-1.0.4.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-core_2.13/3.6.12/json4s-core_2.13-3.6.12.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.9.8/jackson-databind-2.9.8.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/io/github/java-diff-utils/java-diff-utils/4.12/java-diff-utils-4.12.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/jline/jline/3.21.0/jline-3.21.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/modules/scala-parser-combinators_2.13/1.1.2/scala-parser-combinators_2.13-1.1.2.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/modules/scala-xml_2.13/1.3.0/scala-xml_2.13-1.3.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/modules/scala-jline/2.12.1/scala-jline-2.12.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalactic/scalactic_2.13/3.1.4/scalactic_2.13-3.1.4.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-sbt/test-interface/1.0/test-interface-1.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/portable-scala/portable-scala-reflect_2.13/0.1.1/portable-scala-reflect_2.13-0.1.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/github/nscala-time/nscala-time_2.13/2.22.0/nscala-time_2.13-2.22.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/yaml/snakeyaml/1.26/snakeyaml-1.26.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/apache/commons/commons-lang3/3.11/commons-lang3-3.11.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-ast_2.13/3.6.12/json4s-ast_2.13-3.6.12.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-scalap_2.13/3.6.12/json4s-scalap_2.13-3.6.12.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/thoughtworks/paranamer/paranamer/2.8/paranamer-2.8.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.9.0/jackson-annotations-2.9.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.9.8/jackson-core-2.9.8.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/fusesource/jansi/jansi/1.11/jansi-1.11.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/joda-time/joda-time/2.10.1/joda-time-2.10.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/joda/joda-convert/2.2.0/joda-convert-2.2.0.jar [exists ]
Options:
-Yrangepos -Xplugin-require:semanticdb


action parameters:
offset: 276
uri: file://<WORKSPACE>/src/main/scala/topUnit.scala
text:
```scala
package project
import chisel3._
import chisel3.util._

class topUnit(val N: Int, val W: Int, val paral : Int = 1, val K : Int = 16) extends Module {
    val io = IO(new Bundle{
        val broadcast_query = Flipped(Decoupled(Vec(paral, SInt(W.W))))
        val refs = Vec(N, @@Flipped(Decoupled(N, Vec(paral, SInt(W.W)))))
        val addrs = Input(Vec(N, UInt(W.W)))
        val finish = Input(Bool())
        val terminates = Output(Vec(N,Bool())) // handled by topUnit
        val addrOut = Output(Vec(K, UInt(W.W)))
        val addrValid = Output(Bool())
    })
    val topk_unit = Module(new KthSmallestTracker(K, W, W))
    topk_unit.io.finish := io.finish
    io.addrOut := topk_unit.io.addrOut
    io.addrValid := topk_unit.io.addrValid
    val group = Seq.fill(N)(Module(new PE_Module))
    for (i <- 0 until N) {
        group(i).io.query <> io.broadcast_query
        group(i).io.address_i := io.addrs(i)
        group(i).io.dist_k <> topk_unit.io.kthOut
        group(i).io.refs.bits := io.refs.bits.slice(i * paral, (i+1) * paral)
        group(i).io.refs.valid := io.refs.valid
        io.terminates(i) := group(i).io.skip_to_next
        if (i >= 1) {
            group(i).io.address_north <> group(i - 1).io.address_south
            group(i).io.dist_north <> group(i - 1).io.dist_south
        }
        if (i == N-1){
            topk_unit.io.in.bits.addr := group(i).io.address_south.bits
            topk_unit.io.in.bits.distance  := group(i).io.dist_south.bits
            topk_unit.io.in.valid := group(i).io.address_south.valid && group(i).io.dist_south.valid
        }
    }
}
```



#### Error stacktrace:

```
java.base/java.lang.String.checkBoundsOffCount(String.java:4591)
	java.base/java.lang.String.rangeCheck(String.java:304)
	java.base/java.lang.String.<init>(String.java:300)
	scala.tools.nsc.interactive.Global.typeCompletions$1(Global.scala:1244)
	scala.tools.nsc.interactive.Global.completionsAt(Global.scala:1282)
	scala.meta.internal.pc.SignatureHelpProvider.$anonfun$treeSymbol$1(SignatureHelpProvider.scala:390)
	scala.Option.map(Option.scala:242)
	scala.meta.internal.pc.SignatureHelpProvider.treeSymbol(SignatureHelpProvider.scala:388)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCall$.unapply(SignatureHelpProvider.scala:205)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.visit(SignatureHelpProvider.scala:316)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.traverse(SignatureHelpProvider.scala:310)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.$anonfun$visit$5(SignatureHelpProvider.scala:346)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.$anonfun$visit$5$adapted(SignatureHelpProvider.scala:323)
	scala.collection.IterableOnceOps.foreach(IterableOnce.scala:575)
	scala.collection.IterableOnceOps.foreach$(IterableOnce.scala:573)
	scala.collection.AbstractIterable.foreach(Iterable.scala:933)
	scala.collection.IterableOps$WithFilter.foreach(Iterable.scala:903)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.$anonfun$visit$3(SignatureHelpProvider.scala:323)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.$anonfun$visit$3$adapted(SignatureHelpProvider.scala:322)
	scala.collection.IterableOnceOps.foreach(IterableOnce.scala:575)
	scala.collection.IterableOnceOps.foreach$(IterableOnce.scala:573)
	scala.collection.AbstractIterable.foreach(Iterable.scala:933)
	scala.collection.IterableOps$WithFilter.foreach(Iterable.scala:903)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.visit(SignatureHelpProvider.scala:322)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.traverse(SignatureHelpProvider.scala:310)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.fromTree(SignatureHelpProvider.scala:279)
	scala.meta.internal.pc.SignatureHelpProvider.signatureHelp(SignatureHelpProvider.scala:27)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$signatureHelp$1(ScalaPresentationCompiler.scala:332)
```
#### Short summary: 

java.lang.StringIndexOutOfBoundsException: offset 285, count -9, length 1600