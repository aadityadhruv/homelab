#!/bin/bash
/usr/sbin/fcgiwrap -s unix:/run/fcgiwrap.socket &
caddy run --config /etc/caddy/Caddyfile

