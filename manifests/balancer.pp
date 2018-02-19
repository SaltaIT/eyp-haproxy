define haproxy::balancer(
                          $listen,
                          $balancer_name = $name,
                          $mode          = 'tcp',
                          $balance_mode  = 'roundrobin',
                        ) {
  # listen push 0.0.0.0:22
  # 	mode tcp
  # 	balance roundrobin
  # 	server honeypot1 172.16.101.6:2222
  concat::fragment{ "balancer: ${balancer_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "99-${balancer_name}-0",
    content => template("${module_name}/balancer.erb"),
  }
}
