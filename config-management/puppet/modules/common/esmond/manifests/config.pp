class esmond::config {
  require perfsonar
  file { [ "/opt/perfsonar_ps/puppet", "/opt/perfsonar_ps/puppet/scripts", "/opt/perfsonar_ps/puppet/status" ]:
     ensure => directory,
     before => File [ "/opt/perfsonar_ps/puppet/scripts/configure_esmond" ],
  }

  file { "/opt/perfsonar_ps/puppet/scripts/configure_esmond":
    owner => "root",
    group => "root",
    mode => 544,
    content => template("esmond/configure_esmond.erb"),
    require => Class["esmond::install"],
    notify  => Class["esmond::service"]
  }
  exec { "configure_esmond":
    command => "/opt/perfsonar_ps/puppet/scripts/configure_esmond",
    creates => "/opt/perfsonar_ps/puppet/status/configure_esmond_ran"
  }

  # TODO: Test once the default regular_testing config is updated
  if $perfsonar::regular_testing {
    file { "/opt/perfsonar_ps/puppet/scripts/configure_regular_testing":
      owner => "root",
      group => "root",
      mode => 544,
      content => template("esmond/configure_regular_testing.erb"),
      require => Class["esmond::install"],
      notify  => Class["esmond::service"]
    }
    exec { "configure_regular_testing":
      command => "/opt/perfsonar_ps/puppet/scripts/configure_regular_testing",
      creates => "/opt/perfsonar_ps/puppet/status/configure_regular_testing_ran"
    }
 }

}
