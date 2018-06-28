# Internal
#
# Installs the package
#
class pptpd::install {

  package { $pptpd::package_name:
    ensure => $pptpd::package_ensure,
  }

  if $pptpd::module_manage {
    include ::kmod

    kmod::load { 'ppp_mppe': }
  }
}
