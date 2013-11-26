class common {
  apt::pin { 'mcollective':
    priority   => 700,
    originator => 'Debian',
    packages   => 'mcollective*',
    codename   => $::lsbdistcodename,
  }
  package { 'curl': ensure => 'present' }
}
