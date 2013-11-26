class puppet {
	
	exec { 'puppet source get':
	  	command => 'wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb',
	  	tries => '3',
	}

	exec { 'puppet source install':
	  	command => 'dpkg -i puppetlabs-release-precise.deb',
	  	require => Exec['puppet source get'],
	}

	package { 'puppet software':
		ensure => latest,
		require => [ 
					Class['apt'], 
					Exec['puppet source install']
				   ],
	}
}