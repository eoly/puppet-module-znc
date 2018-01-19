# znc::config
#
# ZNC config class
#
class znc::config {

  $config_path = "${znc::znc_conf_dir}/znc.conf"
  $znc_user    = $znc::znc_user
  $znc_group   = $znc::znc_group

  # ZNC Global Settings
  $anon_ip_limit        = $znc::anon_ip_limit
  $connect_delay        = $znc::connect_delay
  $max_buffer_size      = $znc::max_buffer_size
  $server_throttle      = $znc::server_throttle
  $skin                 = $znc::skin
  $protect_web_sessions = $znc::protect_web_sessions
  $status_prefix        = $znc::status_prefix
  $hide_version         = $znc::hide_version
  $motd                 = $znc::motd
  $ssl_cert_file        = $znc::ssl_cert_file
  $load_module_webadmin = $znc::load_module_webadmin


  datacat { $config_path:
    owner    => $znc_user,
    group    => $znc_group,
    mode     => '0600',
    template => 'znc/config/global.conf.erb',
  }
}
