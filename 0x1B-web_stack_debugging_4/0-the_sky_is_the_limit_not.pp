# Increase the ULIMIT in order to increase the amount of traffic an Nginx server.

# Increase  ULIMIT of the default F
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin'
}

# The Nginx
exec { 'nginx-restart':
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
