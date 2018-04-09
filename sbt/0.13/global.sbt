libraryDependencies += {
  val version = scalaBinaryVersion.value match {
    case "2.10" => "1.0.3"
    case _ ⇒ "1.1.0"
  }
  "com.lihaoyi" % "ammonite" % version cross CrossVersion.full
}

initialCommands in console := "ammonite.Main.main(Array())"
