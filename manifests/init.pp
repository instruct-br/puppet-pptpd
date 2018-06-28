# pptpd class
#
# Install and configure pptpd
#
class pptpd (
  String                                                        $package_name,
  Boolean                                                       $module_manage   = true,
  String                                                        $options_file    = '/etc/ppp/options.pptpd',
  Integer                                                       $stimeout        = 10,
  Boolean                                                       $debug           = false,
  Boolean                                                       $bcrelay         = false,
  String                                                        $localip         = $::ipaddress,
  String                                                        $remoteip        = '192.168.0.100-200',
  Boolean                                                       $noipparam       = false,
  Boolean                                                       $logwtmp         = false,
  Array                                                         $dns_servers     = ['8.8.8.8', '8.8.4.4'],
  String                                                        $server_name     = 'pptpd',
  Array[
    Struct[
      {
        username     => String,
        password     => String,
        Optional[ip] => String,
      }
    ]
  ]                                                             $users           = [],
  Enum['present','installed','absent','purged','held','latest'] $package_ensure  = 'latest',
) {
  include pptpd::install
  include pptpd::config
  include pptpd::service
  include pptpd::connections
  Class['pptpd::install']
  -> Class['pptpd::config']
  -> Class['pptpd::service']
  -> Class['pptpd::connections']
}
