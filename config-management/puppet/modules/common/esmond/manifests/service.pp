class esmond::service {
  service { "cassandra":
    enable => true,
    hasrestart => true,
    hasstatus => true,
    ensure => running,
    require => Class["esmond::config"]
  }
  service { "postgresql":
    enable => true,
    hasrestart => true,
    hasstatus => true,
    ensure => running,
    require => Class["esmond::config"]
  }
}
