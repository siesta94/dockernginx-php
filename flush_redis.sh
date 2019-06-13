#/bin/bash
a=$(basename "$PWD")
#echo "$a"
docker container exec "$a"_redis_1 redis-cli flushall
