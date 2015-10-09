# Manifest to manage the pcscd service
#
class software::pcscd {
  case $::operatingsystem {
    Solaris: {
      notice('Need Solaris info for pcscd')
    }
    RedHat:{
      service {'pcscd':
        ensure => 'stopped',
        enable => false,
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, pcscd.pp manifest]')
    }
  }
}