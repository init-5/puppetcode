class software::daytime_stream
{
  case $::operatingsystem {
    Solaris: {
    }
    RedHat: {
      service { "daytime-stream":
        ensure => "stopped",
      }
  }
}




}
