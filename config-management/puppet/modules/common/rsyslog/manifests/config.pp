class rsyslog::config {
  # assume it's a client unless it's a server (don't allow both)
  file { "/etc/rsyslog.conf":
    owner => "root",
    group => "root",
    mode => 444,
    content => template("rsyslog/rsyslog.conf.erb"),
    require => Class["rsyslog::install"],
    notify  => Class["rsyslog::service"]
  }

  file { "/etc/rsyslog.d": 
    ensure => directory
  }

  if $rsyslog::server {
    file { "/etc/rsyslog.d/rsyslog-server.conf":
      owner => "root",
      group => "root",
      mode => 444,
      content => template("rsyslog/rsyslog.d-rsyslog-server.conf.erb"),
      require => Class["rsyslog::install"],
      notify  => Class["rsyslog::service"],
    }
  } else {
    file { "/etc/rsyslog.d/rsyslog-server.conf":
      ensure => absent
    }

  }

}

