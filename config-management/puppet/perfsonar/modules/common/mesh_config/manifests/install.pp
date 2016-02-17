class mesh_config::install {

  if $mesh_config::client {
    package { "perfsonar-meshconfig-agent":
      ensure => latest
    }
  }

  if $mesh_config::server {
    package { "perfsonar-meshconfig-jsonbuilder":
	  ensure => latest
    }
  }

}
