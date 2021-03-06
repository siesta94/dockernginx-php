## Docker LEMP with all PHP versions + Redis and few useful shell scripts
- Install docker and docker compose.
- Then just ```docker-compose build -> docker-compose up -d```  
### There are couple shell scripts:
- ```./clear_mag_cache.sh``` - clearing cache from ../project/*/var/cache and full_page_cache.  
- ```./flush_redis_cache.sh``` - clearing redis cache inside of container.  
- ```./restart_all.sh``` - restarts all containers from project. 
- ```./killall.sh``` - kill all containers from project. 
- ```./nginx_reload.sh``` - reloading nginx inside of container.  
- ```./importdb.sh``` - Will ask for DB name inside of mysql and .sql file you want to import. 
- ```./phpinfo``` - Will echo phpinfo page into ../projects/nginx_test/index.php.  
### Editing configuration files:  
Nginx configuration files are located in ```nginx/confings/*.conf``` and they are linked as volume. Upon changing those files just run ```./nginx_reload.sh``` so it takes efect.  
### PHP
Depending on PHP version you want edit nginx configuration with ```container_name:9000``` (example: fastcgi_pass dockernginx_fpm56_1:9000)  

Add to your host files 127.0.0.1 php56.com  
Add to your host files 127.0.0.1 php70.com  
Add to your host files 127.0.0.1 php71.com  
Add to your host files 127.0.0.1 php72.com  

And run ```./phpinfo.sh```  

Navigate to browser and open those urls!

### Logs
Logs are located in ```logs/nginx/*.log``` 
