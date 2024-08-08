FROM docker.io/library/alpine:3.20.2

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL


ENV UMASK="0002" \
    TZ="Etc/UTC"

USER root
WORKDIR /app

#hadolint ignore=DL3018,DL3013
RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        catatonit \
        curl \
        tzdata \
    && \
    curl -fsSL -o /app/bin/playit "https://github.com/playit-cloud/playit-agent/releases/download/v${VERSION}/playit-$(echo $TARGETPLATFORM | sed 's/\//-/g')" \
    && chown -R root:root /app \
    && chmod -R 755 /app \
    && rm -rf \
        /root/.cache \
        /root/.cargo \
        /tmp/*

COPY ./apps/playit/entrypoint.sh /entrypoint.sh

USER nobody:nogroup
WORKDIR /config
VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/catatonit", "--"]
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/playit-cloud/playit-agent"
