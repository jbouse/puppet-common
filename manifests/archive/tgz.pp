define common::archive::tgz (
  $ensure = present,
  $source = undef,
  $target = "/tmp/${name}"
) {
  validate_string($source)

  Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin' }

  if !defined(Package['curl']) {
    package { 'curl': ensure => present }
  }

  if $ensure != 'absent' {
    exec { "${name} unpack":
      command => "curl -s \"${source}\" | tar -xzf - -C ${target} --no-same-owner && touch ${name}",
      creates => $name,
      require => Package['curl'];
    }
  }
}
