# FHLBA Samba Software Management manifest
#
class software::samba {
  case $::operatingsystem {
    Solaris: {
      notice('Samba package not installed on Solaris.')
    }
    RedHat: {
      # Ensure Samba is not installed
      package {'samba':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, samba.pp manifest]')
    }
  }
}
