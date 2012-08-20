class apache2 {
  package { 'apache2':
    ensure => present,
    before => File['/etc/apache2/apache2.conf']
  }

  package { ['libapache2-mod-php5', 'libapache2-mod-auth-mysql']:
    ensure => present
  }

  service { 'apache2':
    ensure => true,
    enable => true
  }

  file { '/etc/apache2/apache2.conf':
    source  => 'puppet:///modules/apache2/apache2.conf',
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package['apache2'],
    notify  => Service['apache2']
  }

  file { '/etc/apache2/conf.d/vhosts.conf':
    source  => 'puppet:///modules/apache2/vhosts.conf',
    mode    => 644,
    owner   => root,
    group   => root,
    require => Package['apache2'],
    notify  => Service['apache2']
  }

}
