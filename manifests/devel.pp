class common::devel (
  $ensure = 'present'
) {
  Apt::Source {
    location    => 'http://apt.puppetlabs.com',
  }
  apt::source { 'puppetlabs-devel':
    ensure => $ensure,
    repos  => 'devel'
  }
  apt::pin { 'mcollective-puppetlabs':
    ensure     => $ensure,
    priority   => 750,
    originator => 'Puppetlabs',
    packages   => 'mcollective*',
    codename   => $::lsbdistcodename,
  }
}
