class puppet {
	
	exec { 'wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb':
	  	command => 'wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb',
	    timeout => 0,
	}

	exec { 'dpkg -i puppetlabs-release-precise.deb':
	  	command => 'dpkg -i puppetlabs-release-precise.deb',
	    timeout => 0,
	}

	package { 'puppet':
		ensure => latest,
		require => Class['apt'],
	}
}