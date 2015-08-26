class mesh_config::service {
  service { "mesh_config":
    enable => true,
    hasrestart => true,
    hasstatus => true,
    ensure => running,
    require => Class["mesh_config::config"]
  }
}
