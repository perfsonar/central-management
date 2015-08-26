class mesh_config::install {

  if $mesh_config::client {
    package { "perl-perfSONAR_PS-MeshConfig-Agent":
      ensure => latest
    }
  }

  if $mesh_config::server {
    package { "perl-perfSONAR_PS-MeshConfig-JSONBuilder":
	  ensure => latest
    }
  }

}
