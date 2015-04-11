node basenode {
  include helloworld::motd
}

node agent inherits basenode {
  include tomcat
}
