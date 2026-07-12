FROM debian:bookworm-slim

LABEL org.opencontainers.image.title="SinusBot Pterodactyl"
LABEL org.opencontainers.image.description="Runtime image for SinusBot 1.1 on Pterodactyl"
LABEL org.opencontainers.image.source="https://github.com/DarkyCage/cage-ptero-eggs"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV USER=container
ENV HOME=/home/container
ENV DISPLAY=:99
ENV XDG_RUNTIME_DIR=/tmp/runtime-container

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        bzip2 \
        ca-certificates \
        curl \
        dbus \
        ffmpeg \
        file \
        iproute2 \
        jq \
        less \
        libasound2 \
        libatomic1 \
        libevent-2.1-7 \
        libfontconfig1 \
        libglib2.0-0 \
        libgl1 \
        libegl1 \
        libnss3 \
        libpci3 \
        libxcb-cursor0 \
        libxcb-icccm4 \
        libxcb-keysyms1 \
        libxcb-randr0 \
        libxcb-render-util0 \
        libxcb-shape0 \
        libxcb-xinerama0 \
        libxcb-xkb1 \
        libxcomposite1 \
        libxcursor1 \
        libxi6 \
        libxkbcommon-x11-0 \
        libxkbcommon0 \
        libxslt1.1 \
        libxss1 \
        libxtst6 \
        procps \
        psmisc \
        python3 \
        python3-pip \
        screen \
        sudo \
        tar \
        tini \
        wget \
        x11-xkb-utils \
        x11vnc \
        xvfb \
    && useradd --create-home --home-dir /home/container --shell /bin/bash container \
    && mkdir -p /home/container /tmp/runtime-container \
    && chown -R container:container /home/container /tmp/runtime-container \
    && chmod 0700 /tmp/runtime-container \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --chown=container:container entrypoint.sh /entrypoint.sh

RUN chmod 0755 /entrypoint.sh

USER container
WORKDIR /home/container

STOPSIGNAL SIGINT

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]