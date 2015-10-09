class software::avahi
{
  case $::operatingsystem {
    Solaris: {
    }
    RedHat: {
      service { "avahi-daemon":
        ensure => "stopped",
      }
  }
}




}

