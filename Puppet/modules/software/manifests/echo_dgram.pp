class software::echo_dgram
{
  case $::operatingsystem {
    Solaris: {
    }
    RedHat: {
      service { "echo-dgram":
        ensure => "stopped",
      }
  }
}




}
