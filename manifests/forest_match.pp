# == definition fluentd::forest_match
define fluentd::forest_match (
    $configfile,
    $type,
    $pattern,
    $config   = {},
    $servers  = [],
) {
    $target_file = "/etc/td-agent/config.d/${configfile}.conf"
    concat { $target_file : }
    concat::fragment { "match_${title}":
        target  => $target_file,
        require => Package["${fluentd::package_name}"],
        content => template('fluentd/forest_match.erb'),
    }
}
