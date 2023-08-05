#!/usr/local/bin/env bash

# To support users that are symlinking to docker-compose
dc="$(docker compose version &>/dev/null && echo 'docker compose' || echo 'docker-compose')"

$dc run --rm api /home/api migrate

$dc up -d