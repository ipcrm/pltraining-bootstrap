class bootstrap::profile::gogs {

  include docker
  docker::run {'ciab-gogs':
    image            => 'gogs/gogs',
    ports            => ['10022:22','3000:3000'],
    volumes          => ['/var/gogs:/data'],
  }
}
