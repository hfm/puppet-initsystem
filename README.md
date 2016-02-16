# initsystem

[![Build Status](https://img.shields.io/travis/hfm/puppet-initsystem/master.svg?style=flat-square)](https://travis-ci.org/hfm/puppet-initsystem)
[![Puppet Forge](https://img.shields.io/puppetforge/v/hfm/initsystem.svg?style=flat-square)](https://forge.puppetlabs.com/hfm/initsystem)

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with init_daemon](#setup)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)

## Description

This module aims to detect initsystem of OS.

## Setup

Installing the initsystem module.

## Usage

Installing this module, you can use `$::initsystem` in Puppet manifests.

```puppet
case $::initsystem {
  'sysvinit' {
    # Type your code...
  }
  'upstart' {
    # Type your code...
  }
  'systemd' {
    # Type your code...
  }
  default: {  }
}
```

## Limitations

- RedHat
  - 5.0, 6.0, 7.0
- CentOS
  - 5.0, 6.0, 7.0
- Scientific Linux
  - 5.0, 6.0, 7.0
- Fedora
  - 22, 23
- Debian
  - 6, 7, 8
- Ubuntu
  - 12.04, 14.04, 15.04, 15.10, 16.04
