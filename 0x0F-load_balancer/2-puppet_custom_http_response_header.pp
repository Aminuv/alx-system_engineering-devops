# Creating a custom HTTP head response.

exec { 'update':
  command     => 'sudo apt-get -y update',
  provider => shell,
}

# install ngix
-> exec { 'install':
  command => 'sudo apt-get -y install nginx',
  provider => shell,
}

#add the custun http header
-> exec { 'replace':
  command => 'sudo sed -i "/listen 80 default_server;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-enabled/default',
  provider => shell,
}

# Restart the nginx services
-> exec { 'restart':
  command => 'sudo service nginx restart',
  provider => shell,
}
