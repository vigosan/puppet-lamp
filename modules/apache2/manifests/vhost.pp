define apache2::vhost($port = '80', $ensure = 'present') {
  if $ensure == 'present' {
    file { "/etc/apache2/sites-available/${name}":
      content => template("apache2/vhost.erb"),
      mode    => 664,
      owner   => 'root',
      group   => 'root'
    }

    exec { "a2ensite ${name}":
      unless  => "readlink -e /etc/apache2/sites-enabled/${name}",
      require => File["/etc/apache2/sites-available/${name}"],
      notify  => Service['apache2']
    }
  } else {
    exec { "a2dissite ${name}":
      onlyif => "readlink -e /etc/apache2/sites-enabled/${name}",
      notify  => Service['apache2']
    }
  }
}
