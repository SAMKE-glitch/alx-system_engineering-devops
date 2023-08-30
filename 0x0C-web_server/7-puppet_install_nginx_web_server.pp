# Script to install nginx using puppet

package {'nginx':
  ensure => 'present',
}

exec {'install':
  command  => 'sudo apt-get update ; sudo apt-get -y install nginx',
  provider => shell,

}

exec {'sudo sed -i "s/listen 80 default_server;/listen 80 default_server;\\n\\tlocation \/redirect_me {\\t\\treturn 301 https:\/\/dochine.tech\/;\\n\\t}/" /etc/nginx/sites-available/default':
  provider => shell,
}

exec {'run':
  command  => 'sudo service nginx restart',
  provider => shell,
}
