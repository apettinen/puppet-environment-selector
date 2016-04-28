# Class: tut-environment-selector
# Module initialization
# This module sets the environment for client
# via puppet config set
#
# Variables:
# - environment: desired environment, defaults to testing
# - section: puppet config section, defaults to agent
#
# Antti Pettinen
# Copyright: Tampere University of Technology


class tut_environment_selector ( String $desired_env = 'testing', String $conf_section = 'agent') {
  # if $::operatingsystem == 'windows' {
  #   $puppet_cmd = 'puppet.bat config set environment'
  #   $puppet_cmd_path = 'C:/Program Files/puppet labs/puppet/bin'
  # }
  # else {
  #   $puppet_cmd = 'puppet config set environment'
  #   $puppet_cmd_path = '/opt/puppetlabs/puppet/bin/'
  # }
  $puppet_cmd = $::operatingsystem ? {
    'windows' => 'puppet.bat config set environment'
    default => 'puppet config set environment'
  }

  $puppet_cmd_path = $::operatingsystem ? {
    'windows' => 'C:/Program Files/puppet labs/puppet/bin'
    default => '/opt/puppetlabs/puppet/bin/'
  }

  notify { "Using Puppet command: ${puppet_cmd} from path: ${puppet_cmd_path}": }
  exec { 'configure_environment':
    command => "${puppet_cmd} ${desired_env} --section ${conf_section}",
    path    => $puppet_cmd_path,
  }
}
