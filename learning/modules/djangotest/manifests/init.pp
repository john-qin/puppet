class djangotest{

	exec { 'Create Django Folder':
		command => 'mkdir /home/vagrant/django',
		require => Package[$packages],
		user => 'vagrant',
	}

	exec { 'git init':
		command => 'git init',
		require => Exec['Create Django Folder'],
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
		require => Exec['git add url'],
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
