class esmond::config {
  require perfsonar
  file { [ "/usr/lib/perfsonar/puppet", "/usr/lib/perfsonar/puppet/scripts", "/usr/lib/perfsonar/puppet/status" ]:
     ensure => directory,
     before => File [ "/usr/lib/perfsonar/puppet/scripts/configure_esmond" ],
  }

  file { "/usr/lib/perfsonar/puppet/scripts/configure_esmond":
    owner => "root",
    group => "root",
    mode => 544,
    content => template("esmond/configure_esmond.erb"),
    require => Class["esmond::install"],
    notify  => Class["esmond::service"]
  }
  exec { "configure_esmond":
    command => "/usr/lib/perfsonar/puppet/scripts/configure_esmond",
    creates => "/usr/lib/perfsonar/puppet/status/configure_esmond_ran"
  }

  # TODO: Test once the default regular_testing config is updated
  if $perfsonar::regular_testing {
    file { "/usr/lib/perfsonar/puppet/scripts/configure_regular_testing":
      owner => "root",
      group => "root",
      mode => 544,
      content => template("esmond/configure_regular_testing.erb"),
      require => Class["esmond::install"],
      notify  => Class["esmond::service"]
    }
    exec { "configure_regular_testing":
      command => "/usr/lib/perfsonar/puppet/scripts/configure_regular_testing",
      creates => "/usr/lib/perfsonar/puppet/status/configure_regular_testing_ran"
    }
 }

}
