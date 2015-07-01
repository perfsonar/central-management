class apache::config {
  if ($perfsonar::apache) {
    #if ($perfsonar::http) {
      file { "/etc/httpd/conf/httpd.conf":
        owner => "root",
        group => "root",
        mode => 444,
	content => template("apache/httpd.conf.erb"),
        require => Class["apache::install"],
        notify => Class["apache::service"]
      }    
    #}
    if ($perfsonar::https) {
      file { "/etc/httpd/conf.d/ssl.conf":
        owner => "root",
        group => "root",
        mode => 444,
	content => template("apache/ssl.conf.erb"),
        require => Class["apache::install"],
        notify => Class["apache::service"]
      }
    }
  }
}
