class {
  exec { 'apt-get update':
    timeout => 0,
  }
}
