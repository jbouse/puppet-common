define common::archive::zip (
    $source,
    $filename = basename($source),
    $target
){

    exec {
        "${filename} download":
            command  => "curl -o /tmp/${filename} ${source}",
            creates  => "/tmp/${filename}",
            require => Package["curl"];

        "${name} unpack":
            command => "unzip /tmp/${filename} -d ${target} ; touch ${name}",
            creates => $name,
            require => Exec["${filename} download"];
    }
}

