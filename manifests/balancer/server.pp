define haproxy::balancer::server(
                                  $server_address,
                                  $balancer_name,
                                  $server_name   = $name,
                                  $check         = true,
                                  $backup        = false,
                                ) {
  include ::haproxy
  
  concat::fragment{ "balancer-server: ${balancer_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "99-${balancer_name}-9",
    content => template("${module_name}/balancer/server.erb"),
  }
}
