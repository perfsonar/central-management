class bwctl::service {
 $servicestatus = $perfsonar::bwctl ? {
    true => "running",
    default => "stopped"
  }
  service { "bwctl-server":
    enable => $perfsonar::bwctl,
    hasrestart => true,
    hasstatus => false,
    status    => "/bin/ps ax | grep -v grep | grep bwctld",
    ensure => $servicestatus,
    require => Class["bwctl::config"]
  }
}
