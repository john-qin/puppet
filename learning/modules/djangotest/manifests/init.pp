class djangotest{

	file { '/home/vagrant/django':
		ensure => "directory",
		owner  => 'vagrant',
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
		onlyif => "! test -f /usr/local/bin/papply"
	}


	# exec { 'git pull':
	#	command => 'git pull origin master',
	#	cwd => '/home/vagrant/django',
	#	user => 'vagrant',
	# }


	file { '/usr/local/bin/papply':
		content => "#!/bin/sh\nsudo puppet apply /home/vagrant/django/learning/manifests/default.pp --modulepath=/home/vagrant/django/learning/modules/ $*",
	}

	exec { 'chmod a+x /usr/local/bin/papply':
		user => 'root',
	}

}
