FROM debian:buster

RUN apt update && apt install -y coturn cron procps dnsutils && \
  apt clean && \ 
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /coturn

COPY ./coturn* ./

EXPOSE 3478

CMD ["/bin/bash", "-c", "./coturn.sh"]
