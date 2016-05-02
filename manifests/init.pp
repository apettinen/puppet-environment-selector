# Class: tut_environment_selector
# Module initialization
# This module sets the environment for client
# via puppet config set
#
# Variables:
# - environment: desired environment, defaults to testing
# - section: puppet config section, defaults to agent
#
# Antti Pettinen & Sami Lanu
# Copyright: Tampere University of Technology, IT-Services, 2016
# Apache-2 License

class tut_environment_selector ( String $desired_env = 'testing', String $conf_section = 'agent') {

  $puppet_cmd = $::operatingsystem ? {
    'windows' => 'puppet.bat config set environment',
    default   => 'puppet config set environment',
  }

  $puppet_cmd_path = $::operatingsystem ? {
    'windows' => 'C:/Program Files/puppet labs/puppet/bin',
    default   => '/opt/puppetlabs/puppet/bin/',
  }

  exec { 'configure_environment':
    command => "${puppet_cmd} ${desired_env} --section ${conf_section}",
    path    => $puppet_cmd_path,
  }
}
