class owamp::service {
  service { "owampd":
    enable => true,
    hasrestart => true,
    hasstatus => false,
    status    => "/bin/ps ax | grep -v grep | grep owampd",
    ensure => running,
    require => Class["owamp::config"]
  }
}
