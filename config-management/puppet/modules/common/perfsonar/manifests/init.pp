class perfsonar($mesh = false, 
	$bwctl = false, $bwctl_port=4823, $bwctl_iperf_ports="5001-5300", $bwctl_nuttcp_ports="5301-5600", $bwctl_owamp_ports="5601-5900", $bwctl_peer_ports="6001-6200",
	$owamp = false, $owamp_port=861, $owamp_test_ports="8760-9960",
	$esmond=false, $esmond_pg_username=esmond, $esmond_pg_password=false, $regular_testing=false, $ls_registration_daemon = false,
	$rsyslog_server_host=false, $rsyslog_server=false, $rsyslog_client=true, $rsyslog_tcp=true, $rsyslog_udp=false, $rsyslog_tcp_port=514, $rsyslog_udp_port=514, 
	$primary_interface=eth0, $mesh_config_client=false, $mesh_config_server=false, $web100=false,
	$apache_enable=false,
	$http_port=80, $https_port=443, $http=true, $https=true,
	$toolkit=false
	) {

  if $apache_enable or $esmond or $mesh_config_server {
    $apache=true
  } else {
    $apache=false
  }
  include perfsonar::install, perfsonar::config

}
