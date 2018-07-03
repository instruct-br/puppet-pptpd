# pptpd::connections class
#
# Manage connections
#
class pptpd::connections {

  file { '/etc/ppp/chap-secrets':
    ensure   => file,
    owner    => 'root',
    group    => 'root',
    mode     => '0600',
    seluser  => 'system_u',
    selrole  => 'object_r',
    seltype  => 'usr_t',
    selrange => 's0',
    content  => epp('pptpd/chap-secrets.epp', {
      users       => $pptpd::users,
      server_name => $pptpd::server_name,
    }),
  }
}
