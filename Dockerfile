FROM lscr.io/linuxserver/webtop:ubuntu-xfce

# منع أي نوافذ توقف تفاعلية أثناء التثبيت
ENV DEBIAN_FRONTEND=noninteractive
ENV PUID=1000
ENV PGID=1000
ENV TZ=UTC

# تحديث وتثبيت الحزم الأساسية بصمت وسرعة
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    git \
    curl \
    wget \
    nano \
    && rm -rf /var/lib/apt/lists/*

# تثبيت مكتبات البايثون
RUN pip3 install --no-cache-dir streamlit curl_cffi playwright

EXPOSE 3000
