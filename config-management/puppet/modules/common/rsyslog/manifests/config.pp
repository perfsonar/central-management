class rsyslog::config {
  if $rsyslog::client {
    file { "/etc/rsyslog.conf":
      owner => "root",
      group => "root",
      mode => 444,
      content => template("rsyslog/rsyslog-client.conf.erb"),
      require => Class["rsyslog::install"],
      notify  => Class["rsyslog::service"]
    }
  }
}
