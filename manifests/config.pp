class graylog2::config{
  file { "/etc/graylog2.conf":
    content => template('graylog2/graylog2.conf.erb'),
    owner   => "root",
    group   => "root",
    mode    => '0644',
    require => Class['graylog2::install'],
    notify  => Class['graylog2::service'],
  }
  file { "/etc/graylog2-elasticsearch.yml":
    content => template('graylog2/graylog2-elasticsearch.yml.erb'),
    owner   => "root",
    group   => "root",
    mode    => '0644',
    require => Class['graylog2::install'],
    notify  => Class['graylog2::service'],
  }
}
