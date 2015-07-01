class apache::install {
  if ($perfsonar::apache) {
    package { "httpd":
      ensure => installed
    }

    if ($perfsonar::https) {
      package { "mod_ssl":
        ensure => installed
      }
    }

    
  }
}
