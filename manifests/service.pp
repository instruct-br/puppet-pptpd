# pptpd::service class
#
# Manage the service
#
class pptpd::service {

  $ensure = $pptpd::package_ensure ? {
    'absent' => 'stopped',
    'purged' => 'stopped',
    default  => 'running'
  }

  service { 'pptpd': ensure => $ensure }
}
