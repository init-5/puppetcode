class software::nis
{
  #remove mcstrans
  case $::operatingsystem {
    Solaris: {
    }
    Redhat: {

      #package { "yp-tools" :
      #  ensure => "absent"
      #}

      #package { "ypbind" :
      #  ensure => "absent"
      #}

      exec { "remove nis_client" :
        command => "/usr/bin/yum -y erase yp-tools ypbind",
        onlyif => "/usr/bin/test `/bin/rpm -q ypbind` "
      }

      package { "ypserv" :
        ensure => "absent"
      }

    }
  }
}
