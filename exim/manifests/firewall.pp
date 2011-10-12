# Class: exim::firewall
#
# Manages exim firewalling using custom Firewall wrapper
# By default it opens exim's default port(s) to anybody
# It's automatically included if $firewall=yes
#
# Usage:
# Automatically included if $firewall=yes 
#
class exim::firewall {

    include exim::params

    firewall { "exim_${exim::params::protocol}_${exim::params::port}":
        source      => "${exim::params::firewall_source_real}",
        destination => "${exim::params::firewall_destination_real}",
        protocol    => "${exim::params::protocol}",
        port        => "${exim::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "${exim::params::firewall_enable}",
    }

}
