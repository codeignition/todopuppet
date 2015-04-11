class todoapi {
  exec { 'download todoapi jar':
    command => "/usr/bin/wget URL_HERE -O PATH_HERE"
    creates => "PATH_HERE",
  }
}
