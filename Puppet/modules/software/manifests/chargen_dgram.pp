class software::chargen_dgram
{
  case $::operatingsystem {
    Solaris: {
    }
    RedHat: {
      service { "chargen-dgram":
        ensure => "stopped",
      }
  }
}




}
