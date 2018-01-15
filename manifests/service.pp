# znc::service
#
# ZNC service class
#
class znc::service {
  $service_manage = $znc::service_manage
  $service_name   = $znc::service_name
  $service_ensure = $znc::service_ensure

  if $service_manage {

    if $service_ensure == 'running' {
      $service_enable = true
    } else {
      $service_enable = false
    }

    service { 'znc':
      ensure     => $service_ensure,
      enable     => $service_enable,
      hasstatus  => true,
      hasrestart => true,
      name       => $service_name,
    }
  }
}
