define users::managed_user (
  $username = $title,
  $homedir = "/home/${title}",
  $group = $title,
) {
  
  user { "user_${title}":
    ensure => present,
    name => $username,
    home => $homedir,
    gid => $group,
  }
  
  file { "home_${title}":
    ensure => directory,
    path => $homedir,
  }
  
  file { "sshdir_${title}":
    ensure => directory,
    path => "${homedir}/.ssh",
  }
  
  file { "meow_${title}":
    ensure => file,
    path => "${homedir}/meow",
    content => 'meow',
}
