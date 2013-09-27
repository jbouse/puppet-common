define common::expiringsshkey(
    $sshkey,
    $host_aliases = undefined, 
    $timestamp
) {

    # Calculate the age of this resource by comparing 'now' against $timestamp
    $age = inline_template("<%= require 'time'; Time.now - Time.parse(timestamp) %>")

    # Max age, in seconds.
    if $::expire_max_age {
        $maxage = $::expire_max_age
    } else {
        $maxage = 2700
    }

    if $age > $maxage {
        $expired = true
        notice("Expiring resource $class[$name] due to age > $maxage (actual: $age)")
    } else {
        $expired = false
        notice("Found recently-active $class[$name] (age: $age)")
    }

    sshkey {
        $name:
            type         => rsa,
            key          => $sshkey,
            host_aliases => $host_aliases,
            ensure       => $expired ? { true => absent, false => present };
    }
}
