class bootstrap::profile::classroom ($role = 'master') {
  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # set up the base spec tests
  file { '/opt/pltraining/spec':
    ensure  => directory,
  }
  file { '/opt/pltraining/spec/spec_helper.rb':
    ensure => directory,
    source => 'puppet:///modules/bootstrap/serverspec/spec_helper.rb',
  }
  file { '/opt/pltraining/spec/localhost':
    ensure  => directory,
    recurse => true,
    source  => "puppet:///modules/bootstrap/serverspec/${role}",
  }

  # used for updating and managing the classroom
  package { 'puppet-classroom-manager':
    ensure   => installed,
    provider => gem,
  }

}
