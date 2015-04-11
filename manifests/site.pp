node basenode {
  include helloworld::motd

  class { 'serf':
    bind       =>  $::ipaddress_eth1,
    rpc_addr   =>  "${::ipaddress_eth1}:7373",
    advertise  => $::ipaddress_eth1,
    join => ['10.0.0.10']
  }
}

node agent inherits basenode {
  include todoapi
}
