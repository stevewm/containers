#!/usr/bin/env bash

#shellcheck disable=SC2086
exec \

    fastapi run \
        /app/app/main.py \
            "$@"
