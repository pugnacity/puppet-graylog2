class graylog2::service {

  service { 'graylog2-server':
    provider  => base,
    enable    => true,
    ensure    => 'running',
    start     => '/etc/init.d/graylog2-server start',
    restart   => '/etc/init.d/graylog2-server restart',
    stop      => '/etc/init.d/graylog2-server stop',
    status    => '/etc/init.d/graylog2-server status',
    require   => [Class['graylog2::config'],Class['graylog2::install']],
  }
}
