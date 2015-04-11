node basenode {
  include helloworld::motd

  class { 'serf':
    bind          =>  $::ipaddress_eth1,
    rpc_addr      =>  "${::ipaddress_eth1}:7373",
    advertise     => $::ipaddress_eth1,
    join          => ['10.0.0.10'],
    event_handler => ['/etc/serf/puppet_agent.sh'],
  }

  file { 'puppet agent event handler':
    path    => '/etc/serf/puppet_agent.sh',
    ensure  => present,
    mode    => 0755,
    content => "#!/bin/bash \n sudo puppet agent -t > /var/log/puppet-agent.log",
  }
}

node agent inherits basenode {
  include todoapi
}

node puppet {
  class { 'serf':
    bind       =>  $::ipaddress_eth1,
    rpc_addr   =>  "${::ipaddress_eth1}:7373",
    advertise  => $::ipaddress_eth1,
    join => []
  }
}
