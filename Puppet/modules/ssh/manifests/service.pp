# manifest to control SSH Service
#
class ssh::service {
  case $::operatingsystem {
    Solaris: {
      service {'svc:/network/ssh':
        ensure => 'running',
        enable => true,
      }
    }
    RedHat: {
      # Control SSH Service
      service { 'sshd':
        ensure     => 'running',
        hasstatus  => true,
        hasrestart => true,
        enable     => true,
        require    => Class['ssh::config'],
      }
    }
    default: {
      fail('OS Not able to be determined. [ssh module, service.pp manifest]')
    }
  }
}
