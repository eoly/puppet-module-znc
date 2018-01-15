# znc::service
#
# ZNC service class
#
class znc::service {
  $service_manage = $znc::service_manage
  $service_name   = $znc::service_name
  $service_ensure = $znc::service_ensure

  if $service_manage {

    # Manually set service provider to systemd on Amazon Linux 2
    # which is based off el7 and includes systemd.
    # See issue PUP-8248 - https://tickets.puppetlabs.com/browse/PUP-8248
    if ($::facts['os']['name'] == 'Amazon') and ($::facts['os']['release']['major'] == '2') {
      $service_provider = 'systemd'
    } else {
      $service_provider = undef
    }

    if $service_ensure == 'running' {
      $service_enable = true
    } else {
      $service_enable = false
    }

    service { 'znc':
      ensure     => $service_ensure,
      name       => $service_name,
      enable     => $service_enable,
      provider   => $service_provider,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
