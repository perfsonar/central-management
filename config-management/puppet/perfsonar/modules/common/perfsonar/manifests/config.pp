class perfsonar::config {
file { [ "/opt", "/opt/perfsonar_ps", "/opt/perfsonar_ps/perfsonarbuoy_ma", "/opt/perfsonar_ps/perfsonarbuoy_ma/etc/" ]:
   ensure => directory,
   before => File [ "/opt/perfsonar_ps/perfsonarbuoy_ma/etc/owmesh.conf" ],
}
  file { "/opt/perfsonar_ps/perfsonarbuoy_ma/etc/owmesh.conf":
    owner => "root",
    group => "root",
    mode => 444,
    # When multiple sources are declared, puppet chooses the first one that exists
    source => ["puppet:///modules/perfsonar/owmesh.conf-${perfsonar::mesh}",
		"puppet:///modules/perfsonar/owmesh.conf",],
    require => Class["perfsonar::install"]
    #notify => Class["perfsonar::service"]
  }
}
