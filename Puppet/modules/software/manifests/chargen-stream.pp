class software::chargen-stream
{
  case $::operatingsystem {
    Solaris: {
    }
    RedHat: {
      service { "chargen-stream":
        ensure => "stopped",
      }
  }
}




}
