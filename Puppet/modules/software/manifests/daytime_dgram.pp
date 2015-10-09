class software::daytime_dgram
{
  case $::operatingsystem {
    Solaris: {
    }
    RedHat: {
      service { "daytime-dgram":
        ensure => "stopped",
      }
  }
}




}
