class owamp::service {
  $servicestatus = $perfsonar::owamp ? {
    true => "running",
    default => "stopped"
  }
  service { "owamp-server":
    enable => $perfsonar::owamp,
    hasrestart => true,
    hasstatus => false,
    status    => "/bin/ps ax | grep -v grep | grep owampd",
    ensure => $servicestatus,
    require => Class["owamp::config"]
  }
}
