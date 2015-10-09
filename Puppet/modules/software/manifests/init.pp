# Class: software
#
# This module manages software
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class software {
  include software::apache
  include software::dovecot
  include software::kdump
  include software::krb5
  include software::mdmonitor
  include software::pcscd
  include software::rsh
  include software::samba
  include software::snmp
  include software::squid
  include software::talk
  include software::telnet
  include software::tftp
  #include dns  already defined
  #include ldap
  #include nis
  include software::mcstrans
  include software::chargen_dgram
  include software::chargen-stream
  include software::daytime_dgram
  include software::daytime_stream
  include software::echo_dgram
  include software::echo_stream
  include software::tcpmux_server
  include software::setroubleshoot
  include software::avahi
  include software::firefox
  include software::thunderbird

}
