# == definition fluentd::forest_match
define fluentd::forest_match (
    $target_file,
    $order = 50,
    $type,
    $pattern,
    $config   = {},
    $servers  = [],
) {
    concat::fragment { "forest_match_${title}":
        target  => $target_file,
        require => Package["${fluentd::package_name}"],
        content => template('fluentd/forest_match.erb'),
        order   => $order,
    }
}
