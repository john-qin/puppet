# manage nginx webserver
class nginx {
  package { 'nginx':
    ensure => '1.1.19-1ubuntu0.4',
  }
}
