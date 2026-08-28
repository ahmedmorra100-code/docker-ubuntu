# استخدام نظام سطح مكتب لينكس خفيف وسريع ومخصص للويب
FROM lscr.io/linuxserver/webtop:ubuntu-xfce

ENV PUID=1000
ENV PGID=1000
ENV TZ=UTC

# تثبيت بايثون وأدوات التطوير ومكتبات التشغيل
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    curl \
    wget \
    nano \
    && rm -rf /var/lib/apt/lists/*

# تثبيت متطلبات البايثون الأساسية
RUN pip3 install --no-cache-dir streamlit curl_cffi playwright

# المنفذ الافتراضي لسطح المكتب الرسومي
EXPOSE 3000
