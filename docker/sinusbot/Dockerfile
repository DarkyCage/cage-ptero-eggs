FROM --platform=$TARGETOS/$TARGETARCH debian:bookworm-slim

LABEL org.opencontainers.image.authors="Cage"
LABEL org.opencontainers.image.source="https://github.com/darkycage/cage-ptero-eggs"
LABEL version="1.0"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        bzip2 \
        ca-certificates \
        curl \
        ffmpeg \
        fontconfig \
        iproute2 \
        less \
        libasound2 \
        libatomic1 \
        libegl1-mesa \
        libevent-2.1-7 \
        libglib2.0-0 \
        liblcms2-2 \
        libnss3 \
        libpci3 \
        libpulse0 \
        libx11-xcb1 \
        libxcb-icccm4 \
        libxcb-image0 \
        libxcb-keysyms1 \
        libxcb-render-util0 \
        libxcb-xinerama0 \
        libxcb-xkb1 \
        libxcomposite1 \
        libxcursor1 \
        libxkbcommon-x11-0 \
        libxkbcommon0 \
        libxss1 \
        libxslt1.1 \
        locales \
        pulseaudio \
        python3 \
        python3-pip \
        sudo \
        tini \
        x11-xkb-utils \
        x11vnc \
        xvfb \
    && useradd -m -d /home/container container \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV USER=container
ENV HOME=/home/container

USER container

WORKDIR /home/container

STOPSIGNAL SIGINT

COPY --chown=container:container ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]

CMD ["/entrypoint.sh"]
