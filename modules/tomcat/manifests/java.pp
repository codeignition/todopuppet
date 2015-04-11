class java {
  class { 'apt':
    always_apt_update => true,
  }

  apt::ppa { 'ppa:webupd8team/java':}

  package { 'oracle-java8-installer':
    ensure  => 'installed',
    require => [
      Apt::Ppa['ppa:webupd8team/java'],
      File['/tmp/java.preseed']
    ]
  }

  package { 'oracle-java8-set-default':
    ensure  => 'installed',
    responsefile => '/tmp/java.preseed',
    require => [
      Apt::Ppa['ppa:webupd8team/java'],
      Package['oracle-java8-installer']
    ]
  }

  file { '/tmp/java.preseed':
    source => 'puppet:///modules/tomcat/java.preseed',
    mode   => '0600',
    backup => false,
  }

  file { '/etc/profile.d/set_java_home.sh':
    ensure  => file,
    group   => root,
    owner   => root,
    mode    => '0755',
    source  => 'puppet:///modules/tomcat/set_java_home.sh',
    require => Package['oracle-java8-installer'],
  }

  file { '/usr/lib/jvm/default-java':
    ensure => 'link',
    target => '/usr/lib/jvm/java-8-oracle',
    require => Package['oracle-java8-installer'],
  }
}
