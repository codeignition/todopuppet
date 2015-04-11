class tomcat {
  require java

  package { 'tomcat7':
    ensure  => 'installed',
    notify => Service['tomcat7'],
  }

  service { 'tomcat7':
    ensure => running,
    enable => true,
  }
}
