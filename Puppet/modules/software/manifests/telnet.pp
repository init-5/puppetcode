# FHLBA Manifest to manage telnet Package
#
class software::telnet {
  case $::operatingsystem {
    Solaris: {
      case $::operatingsystemrelease {
        /^10/: {
          # Place telnetd config file
          notice('Telnet not installed by default on Solaris')
          file {'/etc/default/telnetd':
            ensure => 'present',
            owner  => 'root',
            group  => 'sys',
            mode   => '0444',
            source => 'puppet:///modules/software/etc_default_telnetd',
          }

          # Ensure service is stopped
          service {'svc:/network/telnet:default':
            ensure => 'stopped',
            enable => false,
          }
        }
        /^5.11/: {
          # Place telnetd config file
          notice('Telnet not installed by default on Solaris')
          file {'/etc/default/telnetd':
            ensure => 'present',
            owner  => 'root',
            group  => 'sys',
            mode   => '0644',
            source => 'puppet:///modules/software/etc_default_telnetd',
          }

          # Ensure service is stopped
          service {'svc:/network/telnet:default':
            ensure => 'stopped',
            enable => false,
          }

        }
        default: {
          fail('Could not determine Solaris version [software module, telnet.pp]')
        }
      }
    }
    RedHat: {
      # Uninstall the server package
      package {'telnet-server':
        ensure => 'absent',
      }

      # Uninstall the client package
      package {'telnet':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, telnet.pp manifest]')
    }
  }
}
