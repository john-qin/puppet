class djangotest{

	file { '/home/vagrant/django':
		ensure => "directory",
		owner  => 'root',
	}


	exec { 'git init':
		command => 'git init',
		require => File['/home/vagrant/django'],
		cwd => '/home/vagrant/django',
		user => 'vagrant',
	}

	exec { 'git add url':
		command =>'git remote add origin https://github.com/john-qin/puppet.git',
		require => Exec['git init'],
		cwd => '/home/vagrant/django',
		user => 'vagrant',
	}

	exec { 'git pull':
		command => 'git pull origin master',
		cwd => '/home/vagrant/django',
		user => 'vagrant',
	}


	file { '/usr/local/bin/papply':
		content => template('djangotest/papply.erb'),
	}

	exec { 'chmod a+x /usr/local/bin/papply':
		user => 'root',
	}

}
