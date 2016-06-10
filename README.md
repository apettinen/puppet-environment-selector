# TUT Puppet Environment Selector

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with Environment Selector](#setup)
    * [What Environment Selector affects](#what-environment-selector-affects)
    * [Setup requirements](#setup-requirements)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Development - Guide for contributing to the module](#development)

## Description

Simple module that allows dynamic environment selection based on Hiera data. Works in OS X, Linux and Windows. Still somewhat under development, but we've used it in production.


## Setup

### What Environment Selector affects

Changes the Puppet environment of node.

### Setup Requirements

Puppet 4.x onwards, not tested with older versions.


## Usage

Defaults for the module are ```desired_env => 'testing'```and ```section => 'agent'```.

### Simple example:

```
node 'my.node.my.org' {
  class {'tut_environment_selector':
    desired_env => 'testing',
    section     => 'agent',
  }
```

### Example with Hiera:

myhiera.yaml:

```
classes:
- tut_environment_selector

tut_environment_selector::desired_env: "testing"
```



## Development

Contributions and pull requests are welcome.

Copyright 2016 Tampere University of Technology

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
