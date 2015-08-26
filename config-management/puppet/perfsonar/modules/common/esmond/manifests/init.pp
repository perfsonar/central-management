class esmond($mesh=false, $esmond_pg_username=esmond, $esmond_pg_password) {
  require apache
  include esmond::install, esmond::config, esmond::service
}
