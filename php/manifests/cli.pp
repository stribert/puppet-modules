# Class: php::cli
#
# Installs client version of php
#
# Usage:
# include php::cli

class php::cli {

    include php

    package { php-cli:
        name => $operatingsystem ? {
            ubuntu  => "php5-cli",
            debian  => "php5-cli",
            default => "php-cli",
            },
        ensure => present,
    }

}


