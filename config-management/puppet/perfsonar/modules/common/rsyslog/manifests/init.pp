# This module assumes the node is a client unless server=true (don't allow both)
class rsyslog ( $server_host=false, $client=true, $server=false,
		$tcp=true, $tcp_port=514,
		$udp=false, $udp_port=514 ) {
	include rsyslog::install
	include rsyslog::config
	include rsyslog::service
}
