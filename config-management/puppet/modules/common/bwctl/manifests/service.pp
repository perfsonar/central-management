class bwctl::service {
  service { "bwctld":
    enable => true,
    hasrestart => true,
    hasstatus => false,
    status    => "/bin/ps ax | grep -v grep | grep bwctld",
    ensure => running,
    require => Class["bwctl::config"]
  }
}
