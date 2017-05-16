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
                          ) inherits haproxy::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::haproxy::install': } ->
  class { '::haproxy::config': } ~>
  class { '::haproxy::service': } ->
  Class['::haproxy']

}
