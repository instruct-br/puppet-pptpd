![License](https://img.shields.io/badge/license-Apache%202-blue.svg) ![Version](https://img.shields.io/puppetforge/v/instruct/puppetagent.svg) ![Downloads](https://img.shields.io/puppetforge/dt/instruct/puppetagent.svg)

# PPTPD

#### Table of contents

1. [Overview](#overview)
1. [Supported Platforms](#supported-platforms)
1. [Requirements](#requirements)
1. [Installation](#installation)
1. [Usage](#usage)
1. [References](#references)
1. [Development](#development)

## Overview

This module will manage pptpd in your system.


## Supported Platforms

This module was tested under these platforms, all in x86_64 arch:

- Debian 9

## Requirements

### Pre-Reqs

You need internet access to install packages.

- Puppet >= 5.x
  - Hiera >= 3.4
  - Facter >= 2.5

## Installation

Via git:

    # cd /etc/puppetlabs/code/environment/production/modules
    # git clone https://github.com/thiagopena/puppet-pptpd.git pptpd

## Usage

### Quick run

    puppet apply -e "include pptpd"

## References

### Classes

```puppet
pptpd
pptpd::install (private)
pptpd::config (private)
pptpd::service (private)
pptpd::connections (private)
```

## Development

### My dev environment

This module was developed using

- Puppet 5.5.3
  - Hiera 3.4.3 (v5 format)
  - Facter 3.11.2
- CentOS 7.5
- VirtualBox 5.2.12
- Vagrant 2.1.1
