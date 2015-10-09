# FHLBA Dovecot Software Management manifest
#
class software::dovecot {
  case $::operatingsystem {
    Solaris: {
      notice('Dovecot package not installed on Solaris.')
    }
    RedHat: {
      # Ensure Dovecot is not installed
      package {'dovecot':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, dovecot.pp manifest]')
    }
  }
}
