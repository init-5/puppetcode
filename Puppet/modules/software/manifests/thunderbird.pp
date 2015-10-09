# FHLBA Manifest to manage the thunderbird software package
#
class software::thunderbird {
  case $::operatingsystem {
    Solaris: {
      file {'thunder_admin':
        path => '/tmp/admin2',
        ensure => 'present',
        owner  => 'root',
        group  => 'sys',
        mode   => '0444',
        source => 'puppet:///modules/software/pkgrm_admin_file',
      }
      # Remove Thunderbird
      exec{'Remove ThunderBird China':
        command => "/usr/sbin/pkgrm -n SUNWthunderbirdl10n-zh-CN",
        onlyif => "/usr/bin/pkginfo -q SUNWthunderbirdl10n-zh-CN",
      }
      exec{'Remove ThunderBird China Traditional':
        command => "/usr/sbin/pkgrm -n SUNWthunderbirdl10n-zh-TW",
        onlyif => "/usr/bin/pkginfo -q SUNWthunderbirdl10n-zh-TW",
      }
      exec{'Remove ThunderBird France':
        command => "/usr/sbin/pkgrm -n SUNWthunderbirdl10n-fr-FR",
        onlyif => "/usr/bin/pkginfo -q SUNWthunderbirdl10n-fr-FR",
      }
      exec{'Remove ThunderBird Spain':
        command => "/usr/sbin/pkgrm -n SUNWthunderbirdl10n-es-ES",
        onlyif => "/usr/bin/pkginfo -q SUNWthunderbirdl10n-es-ES",
      }
      exec{'Remove ThunderBird Dev':
        command => "/usr/sbin/pkgrm -n SUNWthunderbird-devel",
        onlyif => "/usr/bin/pkginfo -q SUNWthunderbird-devel",
      }
      exec{'Remove ThunderBird Cal':
        command => "/usr/sbin/pkgrm -n -a /tmp/admin2 SUNWthunderbird-calendar",
        onlyif => "/usr/bin/pkginfo -q SUNWthunderbird-calendar",
      }
      exec{'Remove ThunderBird Apoc':
        command => "/usr/sbin/pkgrm -n -a /tmp/admin2 SUNWthunderbird-apoc-adapter",
        onlyif => "/usr/bin/pkginfo -q SUNWthunderbird-apoc-adapter",
      }
      exec{'Remove ThunderBird':
        command => "/usr/sbin/pkgrm -n -a /tmp/admin2 SUNWthunderbird",
        onlyif => "/usr/bin/pkginfo -q SUNWthunderbird",
      }
      File['thunder_admin']-> Exec['Remove ThunderBird Apoc']
      File['thunder_admin']-> Exec['Remove ThunderBird']
    }
    RedHat: {
      # Remove the server package
      package {'thunderbird':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, talk.pp manifest]')
    }
  }
}
