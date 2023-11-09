FROM debian:stable

RUN apt-get update && apt-get install -y \
  make \
  markdown \
  procps \
  python3-pip \
  python3-sphinx \
  python3-sphinx-rtd-theme \
  nginx \
  && mkdir /data && rm -rf /var/lib/apt/lists/*

CMD cd /data && python3 -m http.server 8000
