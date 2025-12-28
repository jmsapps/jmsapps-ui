version       = "1.0.0"
author        = "jmsapps"
license       = "GNU General Public License v2.0"
description   = "Personal website for JMS Apps"
srcDir        = "src"

requires      "https://github.com/jmsapps/ntml == 0.5.2"

task buildjs, "Build JMS Apps":
  exec "nim js -d:release -o:src/index.js src/app.nim"

task cleancache, "Clean cache":
  exec "rm -rf ~/.nimble/pkgcache/githubcom_jmsappsntml* ~/.nimble/pkgs2/ntml-*"
