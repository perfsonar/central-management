class mesh_config($mesh, $client=false, $server=false) {
  include mesh_config::install, mesh_config::config, mesh_config::generate
}
