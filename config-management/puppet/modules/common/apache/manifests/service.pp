class apache::service {
 $servicestatus = $perfsonar::apache ? {
    true => "running",
    default => "stopped"
  }
  service { "httpd":
    enable => $perfsonar::apache,
    hasrestart => true,
    hasstatus => true,
    ensure => $servicestatus,
    require => Class["apache::config"]
  }
}
