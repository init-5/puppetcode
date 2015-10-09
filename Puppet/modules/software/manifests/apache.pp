# FHLBA Apache Software Management manifest
#
class software::apache {
  case $::operatingsystem {
    Solaris: {
      notice('Apache package not installed on Solaris.')
    }
    RedHat: {
      # Ensure Apache service is not running
      service {'httpd':
        ensure => 'stopped',
        enable => false,
      }
    }
    default: {
      fail('OS Not able to be determined.  [software module, apache.pp manifest')
    }
  }
}