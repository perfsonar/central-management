class regular_testing::service {
  service { "regular_testing":
    enable => true,
    hasrestart => true,
    hasstatus => false,
    status    => "/bin/ps ax | grep -v grep | grep 'perfSONAR_PS Regular Testing$'",
    ensure => running,
    require => Class["regular_testing::config"]
  }
}
