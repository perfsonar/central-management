class rsyslog::service {
  service { "rsyslog":
    enable => true,
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    require => Class["rsyslog::config"]
  }
}
