#!/usr/bin/env bash

#shellcheck disable=SC2086
exec \
    dotnet \
    /app/bin/VintagestoryServer.dll \
    --dataPath $DATA_PATH
        "$@"
