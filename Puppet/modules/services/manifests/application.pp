
# Manifest to manage Applicaiton Services
#
class services::application {
  case $::operatingsystem {
    Solaris: {
      # Disable Local Graphical Login Environment
      # Guideline 3.1.3
      service {'svc:/application/graphical-login/cde-login:default':
        ensure => 'stopped',
        enable => false,
      }

      # Disable cde-printinfo
      # Guideline 3.1.3
      service {'svc:/application/cde-printinfo:default':
        ensure => 'stopped',
        enable => false,
      }

      # Disable Local WBEM
      # Guideline 3.1.6
      service {'svc:/application/management/wbem:default':
        ensure => 'stopped',
        enable => false,
      }

      # Disable Local BSD Print Protocol Adapter
      # Guideline 3.1.7
      service {'svc:/application/print/rfc1179:default':
        ensure => 'stopped',
        enable => false,
      }

      # Remaining Services from Server build documentaiton
      service {'svc:/application/management/webmin:default':
        ensure =>'stopped',
        enable => false,
      }
      service {'svc:/application/gdm2-login:default':
        ensure => 'stopped',
        enable => false,
      }
      service {'svc:/application/print/ipp-listener:default':
        ensure => 'stopped',
        enable => false,
      }
      service {'svc:/application/x11/xfs:default':
        ensure => 'stopped',
        enable => false,
      }
      service {'svc:/application/font/stfsloader:default':
        ensure => 'stopped',
        enable => false,
      }
      service {'svc:/application/management/snmpdx:default':
        ensure => 'stopped',
        enable => false,
      }
      service {'svc:/application/management/sma:default':
        ensure => 'stopped',
        enable => false,
      }
    }
    RedHat: {
      notice('No Application Services disabled on RedHat at this time')
    }
    default: {
      fail('OS Not able to be determined. [services module, application.pp manifest]')
    }
  }
}
