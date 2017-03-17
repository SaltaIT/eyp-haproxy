class haproxy::config inherits haproxy {

  # TODO: load multiple configuration files using the -f flag, for example:
  #       haproxy -f conf/http-defaults -f conf/http-listeners ...

  file { '/etc/haproxy/haproxy.cfg':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/haproxycfg.erb"),
  }

  file { '/etc/haproxy/errors':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  #400.http  403.http  408.http  500.http  502.http  503.http  504.http

  file { '/etc/haproxy/errors/400.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/400.http"
  }

  file { '/etc/haproxy/errors/403.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/403.http"
  }

  file { '/etc/haproxy/errors/408.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/408.http"
  }

  file { '/etc/haproxy/errors/500.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/500.http"
  }

  file { '/etc/haproxy/errors/502.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/502.http"
  }

  file { '/etc/haproxy/errors/503.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/503.http"
  }

  file { '/etc/haproxy/errors/504.http':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/haproxy/errors'],
    source  => "puppet:///modules/${module_name}/errors/504.http"
  }

}
