class owamp::install {
  package { "owamp-server":
    ensure => installed
  }

  package {"owamp-client":
    ensure => installed
  }
}
