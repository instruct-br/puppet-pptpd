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
- CentOS 7
- Ubuntu 16.04

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

### Parameters

#### `package_name`

Type: String

The name of the package to install

#### `module_manage`

Type: Boolean

Should the kernel module be managed or not. Defaults to true.

#### `options_file`

Type: String

The name of the file with the configuration. Default to `/etc/ppp/options.pptpd`.

#### `stimeout`

Type: Integer

Specifies timeout (in seconds) on starting ctrl connection. Default to 10.

#### `debug`

Type: Boolean

Turns on (more) debugging to syslog. Default to `false`.

#### `bcrelay`

Type: Boolean

Turns on broadcast relay to clients from interface. Default to `false`.

#### `localip`

Type: String

Specifies the local IP address. Default to `$::ipaddress`.

#### `remoteip`

Type: String

Specifies the remote IP address range. Default to `192.168.0.100-200`.

#### `noipparam`

Type: Boolean

Suppress the passing of the client's IP address to PPP. Default to `false`.

#### `logwtmp`

Type: Boolean

When this is enabled, wtmp will be used to record client connections and disconnections. Default to `false`.

#### `dns_servers`

Type: Array

List of DNS servers for Microsoft Windows clients. Default to `['8.8.8.8', '8.8.4.4']`.

#### `dns_servers`

Type: String

The name of the local system for authentication purposes. Default to `pptpd`.

#### `users`

Type: Array

List of users to be added to `chap-secrets` file. Default to empty list.

#### `options`

Type: Array

List of options (Strings) to be added to `pptpd-options` file. Default to empty list.

#### `ip_forwarding`

Type: Boolean

Enable IP forwarding. Default to `true`.

#### `package_ensure`

Type: Enum['present','installed','absent','purged','held','latest']

The type of ensure the managed package should be enforced. Default to latest.

## Development

### My dev environment

This module was developed using

- Puppet 5.5.3
  - Hiera 3.4.3 (v5 format)
  - Facter 3.11.2
- CentOS 7.5
- VirtualBox 5.2.12
- Vagrant 2.1.1
