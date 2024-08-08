#!/usr/bin/env bash

#shellcheck disable=SC2086
exec \
    /usr/local/bin/buildarr \
            daemon \
            ${BUILDARR_CONFIG_PATH:-/config/buildarr.yml} \
            "$@"
