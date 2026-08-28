FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    curl \
    wget \
    git \
    python3 \
    python3-pip \
    ca-certificates \
    novnc \
    websockify \
    fluxbox \
    x11vnc \
    xvfb \
    xterm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

EXPOSE 8080

CMD ["sh", "-c", "Xvfb :0 -screen 0 1280x800x16 & fluxbox & x11vnc -forever -shared -rfbport 5900 -display :0 & /usr/share/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 8080"]
