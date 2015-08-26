class rhel_common ($web100=false) {
  class {'i2_repo': web100 => $rhel_common::web100 }
}
