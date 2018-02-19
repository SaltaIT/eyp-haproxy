define haproxy::stats (
                        $stats_name   = 'stats',
                        $listen       = $name,
                        $description  = undef,
                        $hide_version = true,
                        $realm        = 'stats',
                        $stats_uri    = '/',
                      ) {
  include ::haproxy

  concat::fragment{ "stats: ${stats_name} ${listen} ${stats_uri}":
    target  => '/etc/haproxy/haproxy.cfg',
    order   => '01',
    content => template("${module_name}/stats.erb"),
  }
}
