Exec { path => '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin' }

# Global variables

$inc_file_path = '/vagrant/puppet/learning/files'
$domain_name = 'discoverious.com'
$user = 'vagrant'
$project = 'discoverious'

$nginx_version = '1.1.19-1ubuntu0.5'
$postgresql_version = '9.3.1'

include aptupdate
include bootstrap
include nginx

class { 'postgresql':
  version => '9.1',
}

class { 'postgresql::server': 
  version => '9.1',
}

postgresql::db { 'discoverious':
  owner => 'feelexit',
  password => 'welcome123',
  
}


include djangotest

