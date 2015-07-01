class perfsonar::install {
  include iptables
  class {'bwctl': mesh => $perfsonar::mesh }

  class {'owamp': mesh => $perfsonar::mesh }

  if $perfsonar::regular_testing {
	class {'regular_testing': mesh => $perfsonar::mesh }
  }
  
  if $perfsonar::ls_registration_daemon {
	class {'ls_registration_daemon': mesh => $perfsonar::mesh }
  }

  if $perfsonar::rsyslog_client or $perfsonar::rsyslog_server {
    	class {'rsyslog': 
		server_host => $perfsonar::rsyslog_server_host,
		client => $perfsonar::rsyslog_client,
		server => $perfsonar::rsyslog_server,
		tcp => $perfsonar::rsyslog_tcp,
		udp => $perfsonar::rsyslog_udp,
		tcp_port => $perfsonar::rsyslog_tcp_port,
		udp_port => $perfsonar::rsyslog_udp_port
	}
  }

  if ($perfsonar::mesh_config_client and $perfsonar::mesh_config_server) {
	class {'mesh_config': mesh => $perfsonar::mesh, client => true, server=> true }
  } elsif $perfsonar::mesh_config_client {
	class {'mesh_config': mesh => $perfsonar::mesh, client => true }
  } elsif $perfsonar::mesh_config_server {
	class {'mesh_config': mesh => $perfsonar::mesh, server => true }
  }

  if $perfsonar::esmond {
      class {'esmond': mesh => $perfsonar::mesh, esmond_pg_password => $perfsonar::esmond_pg_password }
  }

  if $perfsonar::apache {
    include apache
  }
}
