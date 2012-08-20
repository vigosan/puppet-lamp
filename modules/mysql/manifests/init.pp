class mysql {
  package { 'mysql-server':
    ensure => present,
    before => File['/etc/mysql/my.cnf']
  }

  file { '/etc/mysql/my.cnf':
    owner  => root,
    group  => root,
    mode   => 644,
    source => 'puppet:///modules/mysql/my.cnf'
  }

  service { 'mysql':
    ensure    => true,
    enable    => true,
    subscribe => File['/etc/mysql/my.cnf']
  }

  exec { 'mysql_password':
    unless  => 'mysqladmin -uroot -psecret status',
    command => 'mysqladmin -uroot password secret',
    require => Service[mysql]
  }
}
