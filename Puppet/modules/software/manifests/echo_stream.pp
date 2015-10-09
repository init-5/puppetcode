class software::echo_stream
{
  case $::operatingsystem {
    Solaris: {
    }
    RedHat: {
      service { "echo-stream":
        ensure => "stopped",
      }
  }
}




}
