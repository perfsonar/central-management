class rsyslog ( $syslog_server, $client=true, $server=false ) {
	include rsyslog::install
	include rsyslog::config
	include rsyslog::service
}
