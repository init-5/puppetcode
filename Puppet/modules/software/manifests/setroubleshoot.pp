 # remove a package but leave its config files alone
class software::setroubleshoot {
  case $::operatingsystem {
    RedHat: {
      exec { "remove setroubleshoot" :
        command => "/usr/bin/yum -y erase setroubleshoot setroubleshoot-plugins",
        onlyif => "/usr/bin/test `/bin/rpm -q setroubleshoot` ",
        logoutput => true
      }
    }
  }
}
