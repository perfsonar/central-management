class iptables::service {
  exec { "rebuild_iptables":
    command => "/usr/sbin/rebuild-iptables",
    refreshonly => true,
    require => Class["iptables::install"]
  }
}
