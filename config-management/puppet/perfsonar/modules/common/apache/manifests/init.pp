class apache {
  require perfsonar
  include apache::install, apache::config, apache::service
  #notify { "perfsonar apache:  $perfsonar::apache":}
}
