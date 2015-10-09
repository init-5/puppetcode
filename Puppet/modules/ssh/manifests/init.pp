# Class: ssh
#
# This module manages ssh
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class ssh {
  include ssh::config
  include ssh::install
  include ssh::service
}
