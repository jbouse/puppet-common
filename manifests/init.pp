class common {
  package { 'curl': ensure => 'present' }

  mcollective::plugin { 'puppet':  package => true }
  mcollective::plugin { 'package': package => true }
  mcollective::plugin { 'service': package => true }
  mcollective::plugin { 'nrpe':    package => true }
}
