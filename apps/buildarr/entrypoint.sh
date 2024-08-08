#!/usr/bin/env bash


if [[ -n $BUILDARR_CONFIG_PATH ]]; then
    envsubst < "$BUILDARR_CONFIG_PATH" | sponge "$BUILDARR_CONFIG_PATH"
fi

#shellcheck disable=SC2086
exec \
    /usr/local/bin/buildarr \
            daemon \
            ${BUILDARR_CONFIG_PATH:-/config/buildarr.yml} \
            "$@"
