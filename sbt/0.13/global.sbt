/* libraryDependencies ++= (if(scalaBinaryVersion.value == "2.10") { */
/*   Nil */
/* } else if(scalaBinaryVersion.value == "2.11"){ */
/*   Seq("com.lihaoyi" % "ammonite" %  "1.6.7" cross CrossVersion.full) */
/* } else { */
/*   Seq("com.lihaoyi" % "ammonite" %  "2.1.4" cross CrossVersion.full) */
/* }) */

/* sourceGenerators in Test ++= (if(scalaBinaryVersion.value == "2.10") { */
/*   Nil */
/* } else { */
/*   Seq(Def.task { */
/*     val file = sourceManaged.value / "amm.scala" */
/*     IO.write(file, """object amm extends App { ammonite.Main.main(args) }""" ) */
/*     Seq(file) */
/*   }.taskValue) */
/* }) */

fork in (Test, run) := false

