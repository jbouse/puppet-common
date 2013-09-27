define common::archive::tar-gz(
    $ensure = 'present',
    $source, 
    $target = "/tmp/$name"
) {

    Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin' }

    if $ensure != "absent" {
        exec {
            "$name unpack":
                command => "curl -s \"${source}\" | tar -xzf - -C ${target} --no-same-owner && touch ${name}",
                creates => $name,
                require => Package["curl"];
        }
    }
}
