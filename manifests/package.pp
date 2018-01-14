# znc::package
#
# ZNC package class
#
class znc::package {

  $package_ensure = $znc::package_ensure
  $package_name   = $znc::package_name

  package { 'znc':
    ensure => $package_ensure,
    name   => $package_name,
  }
}
