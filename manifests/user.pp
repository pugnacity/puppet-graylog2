class graylog2::user{
   user {   $graylog2::user:
      comment => "User for Graylog",
      name => "${graylog2::user}",
      home => "/home/$graylog2::user",
      managehome => 'true',
      ensure => 'present',
      shell => "/bin/false",
      password => '*',

   }

   group { $graylog2::user:
		ensure 	=> present,
   }
}
