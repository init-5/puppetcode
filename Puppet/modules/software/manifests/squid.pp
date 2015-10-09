# FHLBA Squid Software Management manifest
#
class software::squid {
  case $::operatingsystem {
    Solaris: {
      notice('Squid package not installed on Solaris.')
    }
    RedHat: {
      # Ensure Squid is not installed
      package {'squid':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, squid.pp manifest]')
    }
  }
}