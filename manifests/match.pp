# == definition fluentd::match
define fluentd::match (
  $ensure   = present,
  $target_file,
  $config   = {},
  $order = 50,
  $pattern,
) {
    concat::fragment { "match_${title}":
      target  => $target_file,
      require => Package["${fluentd::package_name}"],
      content => template('fluentd/match.erb'),
      order   => $order,
    }
}
