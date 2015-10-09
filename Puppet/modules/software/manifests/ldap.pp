class software::ldap
{
  case $::operatingsystem {
    Solaris: {
    }
    Redhat: {
      package { "openldap-servers" :
        ensure => "absent"
      }
      #not removing due to dependencies
      #package { "openldap-clients" :
      #  ensure => "absent"
      #}

    }
  }
}
