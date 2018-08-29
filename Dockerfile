FROM debian:stable-slim

LABEL maintainer="Sven Höper <sven@hoeper.me>"

RUN apt-get update && \
    # prevent "/usr/bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)"
    apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure -f noninteractive locales && \
    apt-get install -y chkrootkit && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["chkrootkit"]

CMD ["-r" "/data"]
