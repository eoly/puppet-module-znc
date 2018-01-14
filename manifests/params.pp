# znc::params
#
# ZNC module parameters
#
# @summary OS specific parameters
#
class znc::params {

  case $facts['os']['family'] {
    'RedHat': {
      $package_ensure = 'installed'
      $package_name   = 'znc'
      $service_name   = 'znc'
      $znc_user       = 'znc'
      $znc_group      = 'znc'
      $znc_home       = '/var/lib/znc'
    }
    default: {
      fail("ZNC module not supported on ${facts['os']['family']}.")
    }
  }

  $service_ensure = 'running'
  $service_manage = true
}
