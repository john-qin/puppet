# manage nginx webserver
class nginx {

	package { 'nginx':
    	ensure => "${nginx_version}",
    	require => Class['aptupdate'],
  	}

  	service { 'nginx':
  		ensure => running,
  		enable => true,
  		require => Package['nginx'],
  	}

  	file { '/etc/nginx/sites-enabled/default':
	    ensure => absent,
	    require => Package['nginx']
	}

	file { 'sites-available config':
	    path => "/etc/nginx/sites-available/${domain_name}",
	    ensure => file,
	    content => template('nginx/nginx.conf.erb'),
	    require => Package['nginx']
	}
  
	file { "/etc/nginx/sites-enabled/${domain_name}":
	    ensure => link,
	    target => "/etc/nginx/sites-available/${domain_name}",
	    require => File['sites-available config'],
	    notify => Service['nginx']
	}

}
