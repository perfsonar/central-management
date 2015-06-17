class rsyslog::install {
  package { "rsyslog":
    ensure => latest
  }
}
