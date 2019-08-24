# TODO:
# http-request add-header <name> <fmt> [<condition>]
# http-request add-header X-Forwarded-Proto https if { ssl_fc }
define haproxy::backend::addheader (
                                  $header_value,
                                  $backend_name,
                                  $header_name = $name,
                                  $condition   = undef,
                                  $order       = '00',
                                ) {
  include ::haproxy

  concat::fragment{ "backend-addheader: ${backend_name} ${header} ${name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "98-${backend_name}-8-${order}",
    content => template("${module_name}/backend/addheader.erb"),
  }
}
