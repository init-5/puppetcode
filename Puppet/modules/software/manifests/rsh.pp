# FHLBA Manifest to manage RSH
#
class software::rsh {
  case $::operatingsystem {
    Solaris: {
      notice('RSH Not installed by default on Solaris.')
    }
    RedHat: {
      # Remove the server package
      package {'rsh-server':
        ensure => 'absent',
      }

      # and remove the client package
      package {'rsh':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, rsh.pp manifest]')
    }
  }
}