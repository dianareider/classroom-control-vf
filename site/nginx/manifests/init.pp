class nginx {
  package {'nginx':
    ensure => present,
  }
  
  File {
    owner => 'root',
    group => 'root',
    mode => '0775',
  }
  
  file {['/var/www','/etc/nginx/conf.d']:
    ensure => directory,
    }
  
  file {'index.html':
    ensure => file,
    path => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html',
  }

  file {'nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
  }

  file {'default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
  }
  
  service {'nginx':
    ensure => running,
    enable => true,
    subscribe => File['nginx.conf','default.conf'],
  }
}
