class php5 {
  package { 'php5':
    ensure => present,
    before => File['/etc/php5/cli/php.ini']
  }

  file { '/etc/php5/cli/php.ini':
    source  => 'puppet:///modules/php5/php.ini',
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package['php5']
  }

  package { ['php5-mysql', 'php5-gd']:
    ensure => present
  }

}
