# znc
#
# ZNC module main class
#
# @summary Install and configure ZNC
#
# @example
#   include znc
class znc (
  String $package_ensure                                  = $znc::params::package_ensure,
  String $package_name                                    = $znc::params::package_name,
  Enum['running', 'stopped'] $service_ensure              = $znc::params::service_ensure,
  Boolean $service_manage                                 = $znc::params::service_manage,
  String $service_name                                    = $znc::params::service_name,
  String $znc_user                                        = $znc::params::znc_user,
  String $znc_group                                       = $znc::params::znc_group,
  Stdlib::Absolutepath $znc_home                          = $znc::params::znc_home,
  Stdlib::Absolutepath $znc_conf_dir                      = $znc::params::znc_conf_dir,
  Stdlib::Absolutepath $znc_conf_path                     = $znc::params::znc_conf_path,
  Integer $anon_ip_limit                                  = $znc::params::anon_ip_limit,
  Integer $connect_delay                                  = $znc::params::connect_delay,
  Integer $max_buffer_size                                = $znc::params::max_buffer_size,
  Integer $server_throttle                                = $znc::params::server_throttle,
  Enum['_default_', 'dark-clouds', 'forest', 'ice'] $skin = $znc::params::skin,
  Boolean $protect_web_sessions                           = $znc::params::protect_web_sessions,
  String $status_prefix                                   = $znc::params::status_prefix,
  Boolean $hide_version                                   = $znc::params::hide_version,
  Optional[String] $motd                                  = $znc::params::motd,
  Stdlib::Absolutepath $ssl_cert_file                     = $znc::params::ssl_cert_file,
  Boolean $load_module_webadmin                           = $znc::params::load_module_webadmin,
) inherits znc::params {

  contain znc::install
  contain znc::config
  contain znc::service
}
