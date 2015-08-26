class i2_repo::install {

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2":
    owner => "root",
    group => "root",
    mode => 444,
    source => "puppet:///modules/i2_repo/RPM-GPG-KEY-Internet2"
  }

  yumrepo { "Internet2":
    mirrorlist => 'http://software.internet2.edu/rpms/el6/mirrors-Toolkit-Internet2',
    enabled => 1,
    gpgcheck => 1,
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2",
    require => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2"]
  }

 if $i2_repo::web100 {
  yumrepo { "Internet2-web100_kernel":
      mirrorlist => 'http://software.internet2.edu/web100_kernel/rpms/el6/mirrors-Internet2-web100_kernel',
      enabled => 1,
      gpgcheck => 1,
      gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2",
      require => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2"]
    }
  }
}
