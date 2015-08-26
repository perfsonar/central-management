define iptables::fragment($ensure) {
  case $ensure {
    absent: {
      file { "/etc/iptables.d/$name":
        ensure => absent,
        notify => Class["iptables::service"]
      }
    }
    present: {
      file { "/etc/iptables.d/$name":
        source => "puppet:///modules/iptables/fragments/$name",
        notify => Class["iptables::service"]
      }
    }
  }
}

