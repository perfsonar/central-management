class esmond::config {
  file { "/etc/esmond/esmond.conf":
    owner => "root",
    group => "root",
    mode => 444,
    source => [ "puppet:///modules/esmond/esmond.conf-${esmond::mesh}",
		"puppet:///modules/esmond/esmond.conf"],
    require => Class["esmond::install"],
    notify => Class["esmond::service"]
  }

  file { "/etc/esmond/esmond.limits":
    owner => "root",
    group => "root",
    mode => 444,
    source => [ "puppet:///modules/esmond/esmond.limits-${esmond::mesh}",
		"puppet:///modules/esmond/esmond.limits"],
    require => Class["esmond::install"],
    notify => Class["esmond::service"]
  }
}
