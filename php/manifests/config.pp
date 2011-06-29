# Define: php::config
#
# Configures PHP (php.ini)
#
# Usage:
# php::config {$file = 'apache', $line, $ensure = 'present' }
#
define php::config ($file = 'apache', $line, $ensure = 'present') {

  include php

    case $file {
      default : { err ( "Unknown file value ${file}" ) }
      apache : { $configfile = $php::params::configfile }
      cli : { $configfile = $php::params::configfile_cli }
    }

  case $ensure {
    default : { err ( "unknown ensure value ${ensure}" ) }
    present : {
      exec {  "echo '${line}' >> '${configfile}'":
        unless => "grep -qFx '$line' '${configfile}'"
      }
    }
    absent: {
      exec { "grep -vFx '${line}' '${configfile}' | tee '${configfile}' > /dev/null 2>&1":
        onlyif => "grep -qFx '${line}' '${configfile}'"
      }
    }
  }
}
