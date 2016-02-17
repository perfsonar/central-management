class ls_registration_daemon::service {
  service { "perfsonar-lsregistrationdaemon":
    enable => true,
    hasrestart => true,
    hasstatus => true,
    ensure => running,
    require => Class["ls_registration_daemon::config"]
  }
}
