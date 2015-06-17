class mesh_config::config {
  if $mesh_config::client {
    file { "/opt/perfsonar_ps/mesh_config/etc/agent_configuration.conf":
      owner => "root",
      group => "root",
      mode => 444,
      content => template("mesh_config/agent_configuration.conf.erb"),
      require => Class["mesh_config::install"]
      #notify => Class["mesh_config::service"]
    }
}

  if $mesh_config::server {
    file { "/opt/perfsonar_ps/mesh_config/etc/mesh.conf":
      owner => "root",
      group => "root",
      mode => 444,
      source => [ "puppet:///modules/mesh_config/mesh_config.conf-${mesh_config::mesh}",
		  "puppet:///modules/mesh_config/mesh_config.conf"],
      require => Class["mesh_config::install"],
      notify => Class["mesh_config::generate"]
    }
  }

}
