class bwctl::install {
  package { "bwctl-server":
    ensure => latest
  }

  package { "bwctl-client":
    ensure => latest
  }

  package { "iperf":
    ensure => latest
  }

  package { "iperf3":
    ensure => latest
  }
}
