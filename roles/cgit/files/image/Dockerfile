FROM docker.io/fedora:41

RUN dnf install cgit caddy fcgiwrap openssh-server python3-pygments python3-markdown -y
COPY Caddyfile /etc/caddy/Caddyfile
COPY start.sh start.sh
RUN mkdir /usr/lib/cgit -p
RUN adduser -m git
CMD ["./start.sh"]
