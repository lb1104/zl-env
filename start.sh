#!/bin/bash

redis-server /etc/redis.conf

sh /work/www/2.2.03/env_nodejs/bin/start.sh

httpd -DFOREGROUND