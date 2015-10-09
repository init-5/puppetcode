# FHLB Manifest to manage registering to RHN
#
class software::rhn {
  case $::operatingsystem {
    Solaris: {
      notice('RHN Not available on Solaris')
    }
    RedHat: {
      # First, place the rhn registration file on the host
      file {'/tmp/rhel6-boot.sh':
        ensure => 'present',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
        source => 'puppet:///modules/software/rhel6-boot.sh',
      }

      # Execute the RHN Register only if the patch server isn't already configured
      exec {'rhn_register':
        command => '/tmp/rhel6-boot.sh',
        onlyif  => '/usr/bin/test `cat /etc/sysconfig/rhn/up2date |grep "patchsvr.atl.fhlb.com |awk -F "=" \'{print $2}\'` -ne https://patchsvr.atl.fhlb.com/XMLRPC',
        require => File['/tmp/rhel6-boot.sh'],
      }
    }
    default: {
      fail('OS not able to be determined. [software module, rhn.pp manifest]')
    }
  }
}
