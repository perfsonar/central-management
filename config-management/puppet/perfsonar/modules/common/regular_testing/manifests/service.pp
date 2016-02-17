class regular_testing::service {
  service { "perfsonar-regulartesting":
    enable => true,
    hasrestart => true,
    hasstatus => false,
    status    => "/bin/ps ax | grep -v grep | grep 'perfSONAR Regular Testing$'",
    ensure => running,
    require => Class["regular_testing::config"]
  }
}
