class perfsonar($mesh = false, $bwctl = false, $owamp = false, 
	$ma = false, $regular_testing=false, $ls_registration_daemon = false, 
	$primary_interface=eth0, $mesh_config_client=false, $mesh_config_server=false) {
  #include perfsonar::install
  include perfsonar::install, perfsonar::config #, perfsonar::service
}
