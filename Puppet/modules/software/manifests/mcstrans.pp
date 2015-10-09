class software::mcstrans
{
  #remove mcstrans
  case $::operatingsystem {
    Solaris: {
    }
    Redhat: {
      package { "mcstrans" :
        ensure => "absent"
      }
    }
  }
}
