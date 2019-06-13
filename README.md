# dockerz_nginx-php
- Install docker and docker compose.
- Then just ```docker-compose build -> docker-compose up -d```  
### There are couple shell scripts:
- ```./clear_mag_cache.sh``` - clearing cache from ../project/*/var/cache and full_page_cache.  
- ```./flush_redis_cache.sh``` - clearing redis cache inside of container.  
- ```./restart_all.sh``` - restarts all containers from project. 
- ```./killall.sh``` - kill all containers from project. 
- ```./nginx_reload.sh``` - reloading nginx inside of container.  
- ```./importdb.sh``` - Will ask for DB name inside of mysql and .sql file you want to import. 
### Editing configuration files:  
Nginx configuration files are located in ```nginx/confings/*.conf``` and they are linked as volume. Upon changing those files just run ```./nginx_reload.sh``` so it take efects. Nginx
