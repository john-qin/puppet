Exec { path => '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin' }

# Global variables

$inc_file_path = 'puppet/learning/manifests/files'
$domain_name = 'discoverious.com'
$user = 'vagrant'
$project = 'discoverious'

$nginx_version = '1.1.19-1ubuntu0.4'

include puppet
include bootstrap
#include nginx