#/bin/bash
a=$(basename "$PWD")
docker container exec "$a"_web_1 nginx -s reload
