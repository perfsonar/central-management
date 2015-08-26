filebucket {
  main:
    path => false,
    server => puppet;
  local:
    path => "/var/lib/puppet/clientbucket/";
}

# The hostname of your syslog server
$syslog_server = "syslog.test.com"

node default {
	class {'rhel6': 
		web100 => true}
	class {'perfsonar':
		mesh => 'mesh1',
		owamp => true,
		bwctl => false,
		rsyslog_client => true,
		rsyslog_server_host => $syslog_server,
		rsyslog_server => false,
		apache_enable => true,
		#mesh_config_server => true,
		# optional port definitions (if undefined, defaults are used)
		#rsyslog_tcp_port => '600',
		#http_port => 8000
	}
}

## host1
node 'host1.test.com' {
	include rhel6
	class {'perfsonar':
		mesh => 'mesh1',
		owamp => true,
		bwctl => true,
		regular_testing => true,
		ls_registration_daemon => true,
		mesh_config_client => true,
		mesh_config_server => false,
		esmond => true,
		esmond_pg_password => 'asdf',
		rsyslog_server_host => $syslog_server,
		#rsyslog_client => 'true',
		#rsyslog_tcp_port => '600',
		rsyslog_server => false,
		rsyslog_udp => false,
		#rsyslog_client => true,
	}
}

# host2
node 'host2.test.com' {
	class {'rhel6': 
		web100 => false}
	class {'perfsonar':
		mesh => 'testbed',
		owamp => true,
		bwctl => true,
		rsyslog_client => true,
		rsyslog_server_host => $syslog_server,
		mesh_config_client => true,
		rsyslog_server => true,
		#rsyslog_tcp_port => '600',
		#mesh_config_server => true,
		#apache_enable => true,
	}
}

# syslog server

node 'syslog.test.com' {
	class {'rhel6': 
		web100 => false}
	class {'perfsonar':
		mesh => 'testbed',
		owamp => true,
		bwctl => true,
		rsyslog_server => true,
		#rsyslog_tcp_port => '600',
	}
}
