# FHLBA manifest to manage installation of SSH
#
class ssh::install {
  case $::operatingsystem {
    Solaris: {
      notice ('SSH installed at provision time on Solaris.')
    }
    RedHat: {
      # Install SSH
      package {'openssh':
        ensure => 'installed',
      }
    }
    default: {
      fail('OS Not able to be determined. [ssh module, install.pp manifest]')
    }
  }
}