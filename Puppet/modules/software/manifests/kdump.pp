# Manifest to manage the kdump service
#
class software::kdump {
  case $::operatingsystem {
    Solaris: {
      notice('kdump not provided on Solaris systems')
    }
    RedHat: {
      # Ensure kdump is stopped and disabled at boot
      service {'kdump':
        ensure => 'stopped',
        enable => false,
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, kdump.pp manifest]')
    }
  }
}