class graylog2::install {
  case $::osfamily {
    default : {
      exec { 'wget-graylog-package':
        cwd     => "${graylog2::installdir}",
		  timeout => "600",
        command => "${graylog2::cmdwget} --no-check-certificate https://github.com/Graylog2/graylog2-server/releases/download/0.12.0/graylog2-server-${graylog2::version}.tar.gz",
        creates => "${graylog2::installdir}/graylog2-server-${graylog2::version}.tar.gz",
      }
    }
  }

  	exec { 'untar-graylog-package':
    	cwd     => "${graylog2::installdir}",
    	command => "/bin/tar xfz graylog2-server-${graylog2::version}.tar.gz",
	 	creates => "${graylog2::installdir}/graylog2-server-${graylog2::version}",
   	require => [Exec['wget-graylog-package']],
  	}
	file { "${graylog2::installdir}/graylog2-server-${graylog2::version}":
		owner		=> "${graylog2::user}",
		group		=> "${graylog2::user}",
		recurse	=> "true",
		require	=> [Exec['untar-graylog-package'],Class['graylog2::user']],
   }
	file { "${graylog2::installdir}/graylog2-server":
  		ensure => link,
  		target => "${graylog2::installdir}/graylog2-server-${graylog2::version}",
		require	=> [Exec['untar-graylog-package']],
	}
  file { "/etc/init.d/graylog2-server":
    	content => template('graylog2/graylog2-server.init.erb'),
    	owner   => "root",
    	group   => "root",
    	mode    => '0755',
		require	=> [Exec['untar-graylog-package']],
    	notify  => Class['graylog2::service'],
  	}
}
