class owamp::config {
  file { "/etc/owampd/owampd.conf":
    owner => "root",
    group => "root",
    mode => 444,
    source => [ "puppet:///modules/owamp/owampd.conf-${owamp::mesh}",
		"puppet:///modules/owamp/owampd.conf"],
    require => Class["owamp::install"],
    notify => Class["owamp::service"]
  }

  file { "/etc/owampd/owampd.limits":
    owner => "root",
    group => "root",
    mode => 444,
    source => [ "puppet:///modules/owamp/owampd.limits-${owamp::mesh}",
		"puppet:///modules/owamp/owampd.limits"],
    require => Class["owamp::install"],
    notify => Class["owamp::service"]
  }
}
