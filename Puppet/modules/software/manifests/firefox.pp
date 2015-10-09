# FHLBA Manifest to manage the firefox software package
#
class software::firefox {
  case $::operatingsystem {
    Solaris: {
      file {'/tmp/admin':
        ensure => 'present',
        owner  => 'root',
        group  => 'sys',
        mode   => '0444',
        source => 'puppet:///modules/software/pkgrm_admin_file',
      }
      # Remove Firefox
      exec{'Remove Firefox China':
        command => "/usr/sbin/pkgrm -n SUNWfirefoxl10n-zh-CN",
        onlyif => "/usr/bin/pkginfo -q SUNWfirefoxl10n-zh-CN ",
      }
      exec{'Remove Firefox China Traditional':
        command => "/usr/sbin/pkgrm -n SUNWfirefoxl10n-zh-TW",
        onlyif => "/usr/bin/pkginfo -q SUNWfirefoxl10n-zh-TW",
      }
      exec{'Remove Firefox France':
        command => "/usr/sbin/pkgrm -n SUNWfirefoxl10n-fr-FR",
        onlyif => "/usr/bin/pkginfo -q SUNWfirefoxl10n-fr-FR",
      }
      exec{'Remove Firefox Spain':
        command => "/usr/sbin/pkgrm -n SUNWfirefoxl10n-es-ES",
        onlyif => "/usr/bin/pkginfo -q SUNWfirefoxl10n-es-ES",
      }
      exec{'Remove Firefox Dev':
        command => "/usr/sbin/pkgrm -n SUNWfirefox-devel",
        onlyif => "/usr/bin/pkginfo -q SUNWfirefox-devel",
      }
      exec{'Remove Firefox Apoc':
        command => "/usr/sbin/pkgrm -n -a /tmp/admin SUNWfirefox-apoc-adapter",
        onlyif => "/usr/bin/pkginfo -q SUNWfirefox-apoc-adapter",
      }
      exec{'Remove Firefox':
        command => "/usr/sbin/pkgrm -n -a /tmp/admin SUNWfirefox",
        onlyif => "/usr/bin/pkginfo -q SUNWfirefox",
      }
      File['/tmp/admin']-> Exec['Remove Firefox Apoc']
      File['/tmp/admin']-> Exec['Remove Firefox']
    }
    RedHat: {
      # Remove the server package
      package {'firefox':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, talk.pp manifest]')
    }
  }
}
