puppet-lamp
===========

Install Apache2, PHP5 and MySQL on Debian

# add vhost

```
vhost { 'mysite.com':
  name   => 'mysite.com',
  port   => '80',
  ensure => 'present'
}
```

# remove vhost

```
vhost { 'default':
  ensure => 'absent'
}
```
