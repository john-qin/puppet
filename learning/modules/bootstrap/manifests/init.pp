class bootstrap{
	
	$packages = [
		"curl",
		"git",
		"vim",
	]

	package { $packages:
		ensure => latest,
		require => Class['apt'],
	}

	# file { '~/.bashrc':
	#	ensure => 'present',
	# }

	# file_line { 'directory color':
	#	line => "LS_COLORS='di=0;35' ; export LS_COLORS",
	#	path => '~/.bashrc',
	# }

}
