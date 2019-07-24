#!/bin/bash

a=$(basename "$PWD")
docker rm -f "$a"_web_1 "$a"_fpm7.0_1 "$a"_fpm5.6_1 "$a"_fpm7.2_1 "$a"_fpm7.1_1 "$a"_db_1 "$a"_redis_1
