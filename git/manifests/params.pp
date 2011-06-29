# Class: git::params
#
# Defines git parameters
#
class git::params  {
## DEFAULTS FOR VARIABLES USERS CAN SET
# (Here are set the defaults, provide your custom variables externally)
#


# MODULES INTERNAL VARIABLES
# (Modify only to adapt to unsupported OSes)
  case $operatingsystem {
    ubuntu : {
      case $::lsbdistcodename {
        lucid : {
          $packagename = "git-core"
        }
        default : {
          $packagename = "git"
        }
      }
    }
    default : {
      $packagename = "git"
    }
  }

	$git_basedir="/srv/git"

}
        
