# manifest to manage SSH Configuration
#
class ssh::config {
  case $::operatingsystem {
    Solaris: {
          # Place SSH Daemon Configuration file
          file {'/etc/ssh/sshd_config':
            ensure => 'present',
            owner  => 'root',
            group  => 'sys',
            mode   => '0644',
            source => 'puppet:///modules/ssh/etc_ssh_sshd_config-solaris',
          }
      }
    default: {
          fail('OS Not able to be determined. [ssh module, config.pp manifest]')
        }
    RedHat: {
      # Place SSH Daemon Configuration file
      file { '/etc/ssh/sshd_config':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0600',
        source => 'puppet:///modules/ssh/etc_ssh_sshd_config-redhat',
      }
    }
    default: {
      fail('OS Not able to be determined. [ssh module, config.pp manifest]')
    }
  }
}
