# FHLBA Manifest to manage the krb5 package
#
class software::krb5 {
  case $::operatingsystem {
    Solaris: {
      # Turn off various Kerberos Packages on Solaris
      service {'svc:/network/security/kadmin:default':
        ensure => 'stopped',
        enable => false,
      }

      service {'svc:/network/security/krb5kdc:default':
        ensure => 'stopped',
        enable => false,
      }

      service {'svc:/network/security/krb5_prop:default':
        ensure => 'stopped',
        enable => false,
      }
    }
    RedHat: {
      # Ensure krb5-workstation is off and disabled at boot
      package {'krb5-workstation':
        ensure  => 'absent',
        require => Package['ipa-client'],
      }

      package {'ipa-client':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, krb5.pp manifest]')
    }
  }
}
