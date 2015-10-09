class software::tcpmux_server
{
  case $::operatingsystem {
    Solaris: {
    }
    RedHat: {
      service { "tcpmux-server":
        ensure => "stopped",
      }
  }
}




}
