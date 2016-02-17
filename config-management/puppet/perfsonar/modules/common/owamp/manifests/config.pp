class owamp::config {
  file { "/etc/owamp-server/owamp-server.conf":
    owner => "root",
    group => "root",
    mode => 444,
    source => [ "puppet:///modules/owamp/owampd.conf-${owamp::mesh}",
		"puppet:///modules/owamp/owampd.conf"],
    require => Class["owamp::install"],
    notify => Class["owamp::service"]
  }

  file { "/etc/owamp-server/owamp-server.limits":
    owner => "root",
    group => "root",
    mode => 444,
    source => [ "puppet:///modules/owamp/owampd.limits-${owamp::mesh}",
		"puppet:///modules/owamp/owampd.limits"],
    require => Class["owamp::install"],
    notify => Class["owamp::service"]
  }
}
