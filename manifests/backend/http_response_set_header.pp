# http-response set-header <name> <fmt> [<condition>]
define haproxy::backend::http_response_set_header (
                                                    $frontend_name,
                                                    $header_value,
                                                    $condition   = undef,
                                                    $header_name = $name,
                                                    $unless      = false,
                                                    $order       = '00',
                                                  ) {
  include ::haproxy

  concat::fragment{ "frontend-acl: ${acl_name} ${frontend_name}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => "97-frontend-${frontend_name}-2-http_response_set_header-${order}",
    content => template("${module_name}/frontend/http_response_set_header.erb"),
  }
}
