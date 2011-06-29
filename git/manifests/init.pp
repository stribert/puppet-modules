# Class: git
#
# Installs Git 
#
# Usage:
# include git
#
class git {

  include git::params
  
	package { "git":
    name => $git::params::packagename,
    ensure => present,
  }
}

import "classes/*.pp"
import "definitions/*.pp"

