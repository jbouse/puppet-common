define common::archive::zip (
  $source,
  $target,
  $filename = basename($source),
) {
  exec { "${filename} download":
    command => "curl -o /tmp/${filename} ${source}",
    creates => "/tmp/${filename}",
    require => Package['curl'],
  }

  exec { "${name} unpack":
    command => "unzip /tmp/${filename} -d ${target} ; touch ${name}",
    creates => $name,
    require => Exec["${filename} download"];
  }
}
