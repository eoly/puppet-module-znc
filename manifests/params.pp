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
      $znc_home       = '/var/lib/znc/.znc'
      $znc_conf_dir   = "${znc_home}/configs"
      $znc_conf_path  = "${znc_conf_dir}/znc.conf"
    }
    default: {
      fail("ZNC module not supported on ${facts['os']['family']}.")
    }
  }

  $service_ensure = 'running'
  $service_manage = true

  # ZNC Global Settings
  $anon_ip_limit        = 10
  $connect_delay        = 5
  $max_buffer_size      = 500
  $server_throttle      = 30
  $skin                 = '_default_'
  $protect_web_sessions = true
  $status_prefix        = '*'
  $hide_version         = false
  $motd                 = "ZNC running on ${facts['fqdn']}"
  $ssl_cert_file        = "${znc_home}/znc.pem"
  $load_module_webadmin = false

}
