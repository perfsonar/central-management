filebucket {
  main:
    path => false,
    server => puppet;
  local:
    path => "/var/lib/puppet/clientbucket/";
}

node default {
	include rhel6
	class {'perfsonar':
		owamp => true,
		bwctl => false
	}
  	class {'rsyslog':
		syslog_server => 'syslog.example.com' }
}

}
