class perfsonar::install {
  include i2_repo

  if $perfsonar::bwctl {
      class {'bwctl': mesh => $perfsonar::mesh }
  }

  if $perfsonar::owamp {
      class {'owamp': mesh => $perfsonar::mesh }
  }

  if $perfsonar::regular_testing {
	class {'regular_testing': mesh => $perfsonar::mesh }
  }
  
  if $perfsonar::ls_registration_daemon {
	class {'ls_registration_daemon': mesh => $perfsonar::mesh }
  }

  if ($perfsonar::mesh_config_client and $perfsonar::mesh_config_server) {
	class {'mesh_config': mesh => $perfsonar::mesh, client => true, server=> true }
  } elsif $perfsonar::mesh_config_client {
	class {'mesh_config': mesh => $perfsonar::mesh, client => true }
  } elsif $perfsonar::mesh_config_server {
	class {'mesh_config': mesh => $perfsonar::mesh, server => true }
  }
}
