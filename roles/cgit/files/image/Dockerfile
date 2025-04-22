FROM docker.io/fedora:41

RUN dnf install cgit caddy fcgiwrap openssh-server python3-pygments -y
COPY Caddyfile /etc/caddy/Caddyfile
COPY start.sh start.sh
RUN mkdir /usr/lib/cgit -p
COPY theme.css /usr/share/cgit/theme.css
COPY theme.html /usr/share/cgit/theme.html
COPY syntax-highlighting.py /usr/lib/cgit/syntax-highlighting.py
RUN chmod 777 /usr/lib/cgit/syntax-highlighting.py
RUN adduser -m git
CMD ["./start.sh"]
