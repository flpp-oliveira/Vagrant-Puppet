class { 'postgresql::globals':
  encoding => 'UTF8',
}

class { 'postgresql::server': 
  listen_addresses           => '*',
  postgres_password          => 'postgrespassword',
  require => Class['postgresql::globals'],
}

postgresql::server::db { 'testdb':
  user     => 'admin',
  password => postgresql_password('admin', 'Passw0rd'),
}

postgresql::server::pg_hba_rule { 'allow remote connections with password':
  type        => 'host',
  database    => 'all',
  user        => 'all',
  address     => 'all',
  auth_method => 'md5',
}
