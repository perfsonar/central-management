class mesh_config::generate {
  exec { "generate_mesh_json":
    command => "/usr/lib/perfsonar/bin/build_json -o /var/www/html/mesh.json /etc/perfsonar/meshconfig-mesh.conf",
    refreshonly => true
  }
}
