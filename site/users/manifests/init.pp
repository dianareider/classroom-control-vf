class users {

  user {'fundamentals_user':
    name => fundamentals,
    ensure => present,
  }

}
