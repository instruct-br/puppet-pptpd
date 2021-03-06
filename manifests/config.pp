# pptpd::config class
#
# Manage the server config
#
class pptpd::config {

  $ensure = $pptpd::package_ensure ? {
    'absent' => 'absent',
    'purged' => 'absent',
    default  => 'present'
  }

  file { '/etc/pptpd.conf':
    ensure  => $ensure,
    owner   => 'root',
    mode    => '0644',
    content => epp('pptpd/pptpd.conf.epp', {
      options_file => $pptpd::options_file,
      localip      => $pptpd::localip,
      remoteip     => $pptpd::remoteip,
      stimeout     => $pptpd::stimeout,
      logwtmp      => $pptpd::logwtmp,
      debug        => $pptpd::debug,
      bcrelay      => $pptpd::bcrelay,
      noipparam    => $pptpd::noipparam,
    }),
  }

  file { $pptpd::options_file:
    ensure  => $ensure,
    owner   => 'root',
    mode    => '0644',
    content => epp('pptpd/pptpd-options.epp', {
      server_name => $pptpd::server_name,
      dns_servers => $pptpd::dns_servers,
      options     => $pptpd::options,
    }),
  }

  if $pptpd::ip_forwarding {
    sysctl { 'net.ipv4.ip_forward':
      ensure => present,
      value  => '1',
    }
  }
}
