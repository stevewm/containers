#!/usr/bin/env bash

#shellcheck disable=SC2086
exec \
    /app/bin/playit --secret_path ${CONFIG_FILE_PATH:-/config/playit.toml}
