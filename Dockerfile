FROM debian:stable

RUN apt-get update && apt-get install -y \
  make \
  markdown \
  procps \
  python3-pip \
  nginx \
  && rm -rf /var/lib/apt/lists/*

ADD requirements.txt /tmp

RUN pip install -r /tmp/requirements.txt

RUN mkdir /data

CMD cd /data && python3 -m http.server 8000
