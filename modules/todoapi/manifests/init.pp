class todoapi {
  require tomcat
  require mongodb

  #exec { 'download todoapi jar':
    #command => "/usr/bin/wget URL_HERE -O PATH_HERE"
    #creates => "PATH_HERE",
  #}
}
