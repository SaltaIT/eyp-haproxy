class haproxy(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                            $chroot                = '/var/lib/haproxy',
                            $stats_socket          = '/run/haproxy/admin.sock',
                            $stats_socket_mode     = '660',
                            $user                  = 'haproxy',
                            $group                 = 'haproxy',
                            $daemon                = true,
                            $ssl_options           = 'no-sslv3',
                            $ssl_ciphers           = 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS',
                          ) inherits haproxy::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::haproxy::install': } ->
  class { '::haproxy::config': } ~>
  class { '::haproxy::service': } ->
  Class['::haproxy']

}
