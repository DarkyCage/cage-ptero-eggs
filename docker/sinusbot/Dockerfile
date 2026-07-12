FROM sinusbot/docker:latest

LABEL org.opencontainers.image.title="SinusBot Pterodactyl"
LABEL org.opencontainers.image.description="Pterodactyl-compatible wrapper around the official SinusBot Docker image"
LABEL org.opencontainers.image.source="https://github.com/DarkyCage/cage-ptero-eggs"

USER root

RUN mkdir -p /home/container \
    && chmod 0755 /home/container

COPY entrypoint.sh /entrypoint.sh

RUN chmod 0755 /entrypoint.sh

WORKDIR /home/container

STOPSIGNAL SIGINT

ENTRYPOINT ["/entrypoint.sh"]