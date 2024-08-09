#!/usr/bin/env bash

#shellcheck disable=SC2086
exec \
    /app/bin/playit --secret_path /config/playit.toml --stdout-logs
