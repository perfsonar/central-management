class i2_repo::install {

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2":
    owner => "root",
    group => "root",
    mode => 444,
    source => "puppet:///modules/i2_repo/RPM-GPG-KEY-Internet2"
  }

# for now, comment out the file version while we try using a 'yumrepo'
#  file { "/etc/yum.repos.d/Internet2.repo":
#    owner => "root",
#    group => "root",
#    mode => 444,
#    content => template("i2_repo/Internet2.repo.erb")
#  }

yumrepo { "Internet2":
    mirrorlist => 'http://software.internet2.edu/rpms/el6/mirrors-Toolkit-Internet2',
    enabled => 1,
    gpgcheck => 1,
    gpgkey => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2",
    require => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2"]
}

#  exec { "/bin/rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2":
#    subscribe => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2"],
#    refreshonly => true
#  }
#
#  if $i2_repo::web100 {
#    file { "/etc/yum.repos.d/Internet2-web100_kernel.repo":
#      owner => "root",
#      group => "root",
#      mode => 444,
#      content => template("i2_repo/Internet2-web100_kernel.repo.erb")
#    }
#  }
}
