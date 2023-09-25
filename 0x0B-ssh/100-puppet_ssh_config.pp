# To make changes to our configuration file.
# Just as in the previous config file.
file_line { 'Turn off passwd auth':
  ensure => present,
  line   => '    paswordAuthentication no' ,
  path   => '/etc/ssh/ssh_config',
}

file_line { 'Declare identy file':
  ensure => present,
  line   => '    IdentityFile ~/.ssh/school',
  path   => '/etc/ssh/ssh_config',
}
