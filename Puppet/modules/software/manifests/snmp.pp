# FHLBA Manifest to manage SNMP software
#
class software::snmp {
  case $::operatingsystem {
    Solaris: {
      notice('need SNMP info on Solaris')
    }
    RedHat: {
      # Ensure net-snmpd is not installed
      package {'net-snmpd':
        ensure => 'absent',
      }
    }
    default: {
      fail('OS Not able to be determined. [software module, snmp.pp manifest]')
    }
  }
}