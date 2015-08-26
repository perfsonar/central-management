class ls_registration_daemon::config {
  file { "/opt/perfsonar_ps/ls_registration_daemon/etc/ls_registration_daemon.conf":
    owner => "root",
    group => "root",
    mode => 444,
    content => template("ls_registration_daemon/ls_registration_daemon.conf.erb"),
    require => Class["ls_registration_daemon::install"],
    notify => Class["ls_registration_daemon::service"]
  }

  file { "/opt/perfsonar_ps/ls_registration_daemon/etc/ls_registration_daemon-logger.conf":
    owner => "root",
    group => "root",
    mode => 444,
    source => [ "puppet:///modules/ls_registration_daemon/ls_registration_daemon-logger.conf-${ls_registration_daemon::mesh}",
		"puppet:///modules/ls_registration_daemon/ls_registration_daemon-logger.conf"],
    require => Class["ls_registration_daemon::install"],
    notify => Class["ls_registration_daemon::service"]
  }
}
