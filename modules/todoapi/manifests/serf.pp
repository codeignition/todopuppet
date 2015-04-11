class todoapi::serf {
  include serf
  class{'serf':
    bind            =>  $::ipaddress_eth1
  }
}
