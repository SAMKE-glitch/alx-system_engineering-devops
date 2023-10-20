class myapp::nginx_optimization {

  # Install Nginx
  package { 'nginx':
    ensure => present,
  }

  # Increase the ULIMIT
  file { '/etc/security/limits.d/nginx.conf':
    ensure  => file,
    content => "nginx hard nofile 4096\nnginx soft nofile 4096",
  }

  # Enable and start the Nginx service
  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx'],
  }
}

