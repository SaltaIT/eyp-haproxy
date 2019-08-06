class haproxy::service inherits haproxy {

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $haproxy::manage_docker_service)
  {
    if($haproxy::manage_service)
    {
      service { $haproxy::params::service_name:
        ensure => $haproxy::service_ensure,
        enable => $haproxy::service_enable,
      }
    }
  }
}
