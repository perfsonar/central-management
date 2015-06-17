# this probably needs to be Cassandra, really
class esmond::service {
  service { "esmond":
    enable => true,
    hasrestart => true,
    hasstatus => false,
    status    => "/bin/ps ax | grep -v grep | grep esmond",
    ensure => running,
    require => Class["esmond::config"]
  }
}
