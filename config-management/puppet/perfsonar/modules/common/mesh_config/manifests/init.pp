class mesh_config($mesh, $client=false, $server=false) {
  #require apache
  include mesh_config::install, mesh_config::config, mesh_config::generate
}
