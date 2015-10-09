# FHLBA Manifest to manage the talk software package
#
class software::talk {
  case $::operatingsystem {
    Solaris: {
      # Disable Talk Server
      # Guideline 7.10 - "mesg n" set in environment module for /etc/profile
      service {'svc:/network/talk:default':
        ensure => 'stopped',
        enable => false,
      }
    }
    RedHat: {
      # Remove the server package
      package {'talk-server':
        ensure => 'absent',
      }

      # Remove the client
      package {'talk':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, talk.pp manifest]')
    }
  }
}