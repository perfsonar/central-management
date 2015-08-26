class iptables::install {
  require perfsonar

  package { "iptables":
    ensure => installed
  }

  file { "/usr/sbin/rebuild-iptables":
    ensure => present,
    owner => "root",
    group => "root",
    mode => 755,
    source => "puppet:///modules/iptables/rebuild-iptables"
  }

  file { "/etc/iptables.d":
    ensure => directory,
    owner => "root",
    group => "root",
    mode => 755,
    purge => true,
    recurse => true, 
    before => Class['iptables::service'],
    notify => Class["iptables::service"]
  }

  if $perfsonar::owamp {
    file { "/etc/iptables.d/owamp":
	content => template("iptables/fragments/owamp.erb"),
        notify => Class["iptables::service"]
    }
  }

  if $perfsonar::bwctl {
    file { "/etc/iptables.d/bwctl":
	content => template("iptables/fragments/bwctl.erb"),
        notify => Class["iptables::service"]
    }
  }

  if $perfsonar::rsyslog_server {
    file { "/etc/iptables.d/rsyslog":
	content => template("iptables/fragments/rsyslog-server.erb"),
        notify => Class["iptables::service"]
    }
  }
  
  if $perfsonar::apache {
    file { "/etc/iptables.d/apache":
	content => template("iptables/fragments/apache.erb"),
        notify => Class["iptables::service"]
    }
  }
}
