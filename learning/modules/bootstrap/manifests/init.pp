class bootstrap{
	
	$packages = [
		"curl",
		"git",
		"vim",
	]

	package { $packages:
		ensure => latest,
		require => Class['aptupdate'],
	}


}
