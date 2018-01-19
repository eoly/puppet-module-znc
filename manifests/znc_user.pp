# znc::znc_user
#
# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   znc::znc_user { 'namevar': }
define znc::znc_user (
  Enum['SHA256'] $hash_method = 'SHA256',
  String         $username    = $title,
  String[20]     $salt,
  String[8, 20]  $password,
) {

  $config_path = "${znc::znc_conf_dir}/znc.conf"

  case $hash_method {
    'SHA256': {
      $hash_function = 'SHA-256'
    }
  }

  $password_hash = pw_hash($password, $hash_function, $salt)

  concat::fragment { "znc_user_${username}":
    target  => $config_path,
    content => template('znc/config/user.conf.erb'),
  }
}
