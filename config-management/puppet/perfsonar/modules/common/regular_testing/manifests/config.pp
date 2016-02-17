class regular_testing::config {
  # TODO: Templatize the regular testing configs and update to use esmond instead of psbuoy
  file { "/etc/perfsonar/regulartesting.conf":
    owner => "root",
    group => "root",
    mode => 444,
    source => [ "puppet:///modules/regular_testing/regular_testing.conf-${regular_testing::mesh}",
		"puppet:///modules/regular_testing/regular_testing.conf"],
    require => Class["regular_testing::install"],
    notify => Class["regular_testing::service"]
  }

  file { "/etc/perfsonar/regulartesting-logger.conf":
    owner => "root",
    group => "root",
    mode => 444,
    source => [ "puppet:///modules/regular_testing/regular_testing-logger.conf-${regular_testing::mesh}",
		"puppet:///modules/regular_testing/regular_testing-logger.conf"],
    require => Class["regular_testing::install"],
    notify => Class["regular_testing::service"]
  }
}
