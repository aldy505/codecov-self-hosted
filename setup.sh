#!/usr/local/bin/env bash

# To support users that are symlinking to docker-compose
dc_base="$(docker compose version &>/dev/null && echo 'docker compose' || echo 'docker-compose')"
if [[ "$(basename $0)" = "install.sh" ]]; then
  dc="$dc_base --ansi never --env-file ${_ENV}"
else
  dc="$dc_base --ansi never"
fi

$dc run --rm api /home/api migrate

$dc up -d