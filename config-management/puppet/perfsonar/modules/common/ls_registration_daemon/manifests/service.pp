class ls_registration_daemon::service {
  service { "ls_registration_daemon":
    enable => true,
    hasrestart => true,
    hasstatus => true,
    ensure => running,
    require => Class["ls_registration_daemon::config"]
  }
}
