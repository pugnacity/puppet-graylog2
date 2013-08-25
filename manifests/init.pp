class graylog2 (
        	$version       	= "0.12.0",
        	$user          	= "graylog",
        	$installdir    	= "/opt",
        	$cmdwget       	= "/usr/bin/wget",
			$java_path			= hiera('graylog2::java_path','/usr/local/java/current/bin/java'),
		 	$is_master			= hiera('graylog2::is_master', true), 
		 	$syslog_port		= hiera('graylog2::syslog_port', '5514'), 
		 	$listen_address	= hiera('graylog2::listen_address', '0.0.0.0'), 
		 	$enable_udp			= hiera('graylog2::enable_udp', 'true'), 
			$enable_tcp		   = hiera('graylog2::enable_tcp', 'true'),
			$max_docs_index	= hiera('graylog2::max_docs_index', '20000000'),
			$max_indices		= hiera('graylog2::max_indicies', '20'),
			$shards				= hiera('graylog2::shards', '1'),
			$replicas			= hiera('graylog2::replicas','0'),
			$mongodb_useauth  = hiera('graylog2::mongodb_useauth', 'false'),
			$mongodb_user	   = hiera('graylog2::mongodb_user', 'graylog2'),
			$mongodb_pw		   = hiera('graylog2::mongodb_pw', 'changeit'),
			$mongodb_host		= hiera('graylog2::mongodb_host', '127.0.0.1'),
			$mongodb_db		   = hiera('graylog2::mongodb_db', 'graylog2'),
			$mongodb_port	   = hiera('graylog2::mongodb_port', '27017'),
			$use_gelf		   = hiera('graylog2::use_gelf', 'true'),
			$gelf_listen_address = hiera('graylog2::gelf_listen_address', '0.0.0.0'),
			$gelf_port  		= hiera('graylog2::gelf_port', '12201'),
			$amqp_enabled	   = hiera('graylog2::amqp_enabled', 'false'),
			$amqp_host		   = hiera('graylog2::amqp_host', 'localhost'),
			$amqp_port		   = hiera('graylog2::amqp_port', '5672'),
			$amqp_username	   = hiera('graylog2::amqp_username', 'guest'),
			$amqp_pw			   = hiera('graylog2::amqp_pw', 'guest'),
			$amqp_virtualhost = hiera('graylog2::amqp_virtualhost', '/'),
			$clustername		= hiera('graylog2::clustername', 'graylog2'),
) {
        include graylog2::user
        include graylog2::install
        include graylog2::config
        include graylog2::service
}
