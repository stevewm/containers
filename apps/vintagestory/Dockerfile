FROM mcr.microsoft.com/dotnet/runtime:7.0-alpine

ARG VERSION
ARG CHANNEL

ENV \
    COMPlus_EnableDiagnostics="0"

ENV UMASK="0002" \
    TZ="Etc/UTC"

USER root
WORKDIR /app

#hadolint ignore=DL3018,DL3059
RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        catatonit \
        curl \
        jq \
        tzdata \
    && \
    mkdir -p /app/bin \
    && \
    curl -fsSL "https://cdn.vintagestory.at/gamefiles/${CHANNEL}/vs_server_linux-x64_${VERSION}.tar.gz" \
    | tar xzf - -C /app/bin --strip-components=1 \
    && chown -R root:root /app \
    && chmod -R 755 /app \
    && rm -rf /tmp/*

COPY ./apps/vintagestory/entrypoint.sh /entrypoint.sh

USER nobody:nogroup
WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["/usr/bin/catatonit", "--"]
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://www.vintagestory.at/"
