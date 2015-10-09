# FHLBA Manifest to manage the TFTP Package
#
class software::tftp {
  case $::operatingsystem {
    Solaris: {
      package {'tftp':
        ensure => 'absent',
      }

      # Make sure tftp daemons are stopped
      service {'svc:/network/tftp:default':
        ensure => 'stopped',
        enable => false,
      }
      service {'svc:/network/tftp/udp:default':
        ensure => 'stopped',
        enable => false,
      }
      service {'svc:/network/tftp/udp6:default':
        ensure => 'stopped',
        enable => false,
      }
    }
    RedHat: {
      # Remove the tftp server software
      package {'tftp-server':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, tftp.pp manifest]')
    }
  }
}