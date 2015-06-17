class mesh_config::generate {
  exec { "generate_mesh_json":
    command => "/opt/perfsonar_ps/mesh_config/bin/build_json -o /var/www/html/mesh.json /opt/perfsonar_ps/mesh_config/etc/mesh.conf",
    refreshonly => true
  }
}
