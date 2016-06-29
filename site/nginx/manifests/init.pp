class nginx {
  package {'nginx;:
    ensure => present,
  }
  
  file {'docroot':
    ensure => directory,
    path => '/var/www',
    owner => 'root',
    group => 'root',
    mode => '0775',
    }
  
  file {'index.html':
    ensure => file,
    path => '/var/www/index.html',
    owner => 'root',
    group => 'root',
    mode => '0664',
    source => 'puppet:///modules/nginx/index.html',
  }
}
