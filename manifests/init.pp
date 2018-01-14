# znc
#
# ZNC module main class
#
# @summary Install and configure ZNC
#
# @example
#   include znc
class znc (
  String $package_ensure                     = $znc::params::package_ensure,
  String $package_name                       = $znc::params::package_name,
  Enum['running', 'stopped'] $service_ensure = $znc::params::service_ensure,
  Boolean $service_manage                    = $znc::params::service_manage,
  String $service_name                       = $znc::params::service_name,
  String $znc_user                           = $znc::params::znc_user,
  String $znc_group                          = $znc::params::znc_group,
  Stdlib::Absolutepath $znc_home             = $znc::params::znc_home,
) inherits znc::params {

  contain znc::package
  contain znc::service
}
