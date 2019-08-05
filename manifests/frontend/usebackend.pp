# use_backend bk_app3 if { req.ssl_sni -m end app3.domain.com }
# use_backend <backend> [{if | unless} <condition>]
define haproxy::frontend::usebackend(
                                  $frontend_name,
                                  $condition,
                                  $backend_name  = $name,
                                  $order         = '00',
                                ) {
  include ::haproxy

  concat::fragment{ "frontend-usebackend: ${balancer_name} ${server_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "97-${frontend_name}-9-${order}",
    content => template("${module_name}/frontend/usebackend.erb"),
  }
}
