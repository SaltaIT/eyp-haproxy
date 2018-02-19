define haproxy::balancer(
                          $listen,
                          $balancer_name = $name,
                          $mode          = 'tcp',
                          $balance_mode  = 'roundrobin',
                        ) {
  concat::fragment{ "balancer: ${balancer_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "99-${balancer_name}-0",
    content => template("${module_name}/balancer.erb"),
  }
}
