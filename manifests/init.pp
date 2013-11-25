class common {
  apt::pin { 'mcollective':
    priority   => 700,
    originator => 'Debian',
    packages   => 'mcollective*',
    codename   => $::lsbdistcodename,
  }
}
