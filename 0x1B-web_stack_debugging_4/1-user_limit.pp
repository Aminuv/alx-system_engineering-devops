# enable the user holberton to login and open files without error

# Increase hard file for Holberton.
exec { 'increase_hard_limit_for_holberton':
  command  => 'sed -i "/holberton hard/s/5/2048/" /etc/security/limits.conf',
  provider => 'shell'
}

# increase the file limite fir Holberonton.
exec { 'increase_soft_limit_for_holberton':
  command  => 'sed -i "/holberton soft/s/4/2048/" /etc/security/limits.conf',
  provider => 'shell'
}
