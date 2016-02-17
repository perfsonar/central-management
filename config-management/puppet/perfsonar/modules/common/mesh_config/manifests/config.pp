class mesh_config::config {
  if $mesh_config::client {
    file { "/etc/perfsonar/meshconfig-agent":
      owner => "root",
      group => "root",
      mode => 444,
      content => template("mesh_config/agent_configuration.conf.erb"),
      require => Class["mesh_config::install"]
      #notify => Class["mesh_config::service"]
    }
}

  if $mesh_config::server {
    file { "/etc/perfsonar/meshconfig-mesh.conf":
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
