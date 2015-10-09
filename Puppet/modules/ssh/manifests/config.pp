# FHLBA manifest to manage SSH Configuration
#
class ssh::config {
  case $::operatingsystem {
    Solaris: {
      case $::operatingsystemrelease {
        /^10/: {
          # Place SSH Daemon Configuration file
          file {'/etc/ssh/sshd_config':
            ensure => 'present',
            owner  => 'root',
            group  => 'sys',
            mode   => '0644',
            source => 'puppet:///modules/ssh/etc_ssh_sshd_config-solaris',
            #Do not manage service ssh (centrify conflict)
            #notify => Service['svc:/network/ssh'],
          }

          #Centrify ssh daemon config file
          #etc_centrifydc_sshd_config-solaris
          file {'/etc/centrifydc/sshd_config':
            ensure => 'present',
            owner  => 'root',
            group  => 'sys',
            mode   => '0644',
            source => 'puppet:///modules/ssh/etc_centrifydc_sshd_config-solaris',
            #Do not manage service ssh (centrify conflict)
            #notify => Service['svc:/network/ssh'],
          }

        }
        /^11/: {
          # Place SSH Daemon Configuration file
          file {'/etc/ssh/sshd_config':
            ensure => 'present',
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            source => 'puppet:///modules/ssh/etc_ssh_sshd_config-solaris',
            #Do not manage service ssh (centrify conflict)
            #notify => Service['svc:/network/ssh'],
          }
        }
        default: {
          fail('Solaris Release Version not able to be determined. [ssh module, config.pp manifest]')
        }
      }
    }
    RedHat: {
      # Place SSH Daemon Configuration file
      file { '/etc/ssh/sshd_config':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0600',
        source => 'puppet:///modules/ssh/etc_ssh_sshd_config-redhat',
        #Do not manage service ssh (centrify conflict)
        #notify => Service['sshd'],
      }

      # Place SSH configuration file
      file {'/etc/ssh/ssh_config':
        ensure => 'present',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/ssh/etc_ssh_ssh_config-redhat',
      }

      #place centrify ssh daemon config file
      # file {'/etc/centrifydc/ssh/sshd_config':
      #  ensure => 'present',
      #  owner  => 'root',
      #  group  => 'root',
      #  mode   => '0644',
      #  source => 'puppet:///modules/ssh/etc_centrifydc_sshd_config-redhat',
      #}


    }
    default: {
      fail('OS Not able to be determined. [ssh module, config.pp manifest]')
    }
  }
}
