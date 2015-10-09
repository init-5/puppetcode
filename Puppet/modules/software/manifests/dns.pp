class software::dns
{
  case $::operatingsystem {
    Solaris: {
    }
    Redhat: {
      package { "bind" :
        ensure => "absent"
      }
    }
  }
}
