class common {
  apt::pin { 'mcollective':
    priority   => 700,
    originator => 'Debian',
    packages   => 'mcollective*',
    codename   => $::lsbdistcodename,
  }

  package { 'curl': ensure => 'present' }

  mcollective::plugin { 'puppet': package => true }
  mcollective::plugin { 'package': package => true }
  mcollective::plugin { 'service': package => true }
  mcollective::plugin { 'nrpe': package => true }
}
