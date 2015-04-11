class mongodb {
  package { 'mongodb-server':
    ensure  => 'installed',
    notify => Service['mongodb'],
  }

  service { 'mongodb':
    ensure => running,
    enable => true,
  }
}
