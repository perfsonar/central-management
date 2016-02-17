class bwctl::config {
  if ($perfsonar::bwctl) {
    file { "/etc/bwctl-server/bwctl-server.conf":
      owner => "root",
      group => "root",
      mode => 444,
      source => [ "puppet:///modules/bwctl/bwctld.conf-${bwctl::mesh}",
  		"puppet:///modules/bwctl/bwctld.conf" ],
      require => Class["bwctl::install"],
      notify => Class["bwctl::service"]
    }
  
    file { "/etc/bwctl-server/bwctl-server.limits":
      owner => "root",
      group => "root",
      mode => 444,
      source => [ "puppet:///modules/bwctl/bwctld.limits-${bwctl::mesh}",
  		"puppet:///modules/bwctl/bwctld.limits" ],
      require => Class["bwctl::install"],
      notify => Class["bwctl::service"]
    }
  
    file { "/etc/bwctl-server/bwctl-server.keys":
      owner => "root",
      group => "root",
      mode => 444,
      source => [ "puppet:///modules/bwctl/bwctld.keys-${bwctl::mesh}",
  		"puppet:///modules/bwctl/bwctld.keys" ],
      require => Class["bwctl::install"],
      notify => Class["bwctl::service"]
    }
  }
}
