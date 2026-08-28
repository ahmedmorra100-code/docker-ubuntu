FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# تثبيت التيرمينال ومكتبات التشغيل الضرورية لـ Playwright و Chrome
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    wget \
    git \
    python3 \
    python3-pip \
    ca-certificates \
    ttyd \
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

EXPOSE 8080

# تشغيل التيرمينال المباشر على المنفذ 8080
CMD ["ttyd", "-p", "8080", "-W", "bash"]

