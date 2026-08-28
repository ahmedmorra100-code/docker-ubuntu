FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 1. تثبيت حزم النظام والمكتبات الرسومية اللازمة للمتصفحات
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    wget \
    git \
    python3 \
    python3-pip \
    ca-certificates \
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

# 2. تحميل وتثبيت ttyd الرسمي مباشرة
RUN curl -fsSL https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 -o /usr/local/bin/ttyd \
    && chmod +x /usr/local/bin/ttyd

WORKDIR /root

# المنفذ الافتراضي
EXPOSE 8060

# تشغيل تيرمينال الويب وربطه بمتغير المنفذ التلقائي
CMD ["sh", "-c", "ttyd -p ${PORT:-8060} -W bash"]
