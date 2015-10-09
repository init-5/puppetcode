# Manifest to manage the mdmonitor service
#
class software::mdmonitor {
  case $::operatingsystem {
    Solaris: {
      case $::operatingsystemrelease {
        # Disable Solaris Volume Manager Services
        # Guideline 3.2.12 - allow for older version of Solaris to mirror using mdmonitor
        /^10/: {
          #These services will not exist in a solaris zone
          if (($zonename == "global") and ( $hardwareisa == "sparc") ) {
            service {'svc:/system/metainit:default':
              ensure => 'running',
              enable => true,
            }
            service {'svc:/system/mdmonitor':
              ensure  => 'running',
              enable  => true,
              require => Service['svc:/system/metainit:default'],
            }
          }
          else {
            service {'svc:/system/metainit:default':
              ensure => 'stopped',
              enable => false,
            }
            service {'svc:/system/mdmonitor':
              ensure  => 'stopped',
              enable  => false,
              require => Service['svc:/system/metainit:default'],
            }
          }
        }
        /^11/: {
          # Disable Solaris Volume Manager Services
          # Guideline 3.2.12
          service {'svc:/system/metainit:default':
            ensure => 'stopped',
            enable => false,
          }

          service {'svc:/system/mdmonitor':
            ensure  => 'stopped',
            enable  => false,
            require => Service['svc:/system/metainit:default'],
          }
        }
        default: {
          fail('Could not determine Solaris Version [software module mdmonitor.pp manifest]')
        }
      }
    }
    RedHat: {
      # Ensure mdmonitor is stopped and disabled at boot
      service {'mdmonitor':
        ensure => 'stopped',
        enable => false,
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, mdmonitor.pp manifest]')
    }
  }
}
