  class { 'serf':
    bind       =>  $::ipaddress_eth1,
    rpc_addr   =>  "${::ipaddress_eth1}:7373",
    advertise  => $::ipaddress_eth1,
    join => []
  }
