# Docker ConfigHub
A docker image for [Config Hub](https://www.confighub.com/).

Execute with following:
```
docker run -d \
    -p 8080:80 \
    -e DB_MAIN_URL=jdbc:mysql://<databaseHost>:3306/ConfigHub \
    -e DB_MAIN_DRIVER=com.mysql.jdbc.Driver \
    -e DB_MAIN_USERNAME=<username> \
    -e DB_MAIN_PASSWORD=<password> \
    -e DB_API_URL=jdbc:mysql://<databaseHost>:3306/ConfigHubClientRequests \
    -e DB_API_DRIVER=com.mysql.jdbc.Driver \
    -e DB_API_USERNAME=<username> \
    -e DB_API_PASSWORD=<password> \
    --name confighub \
    confighub/confighub-v1.6.3:latest
```

You may also use PostgreSQL database with
```
    -e DB_MAIN_DRIVER=org.postgresql.Driver
    -e DB_MAIN_URL=jdbc:postgresql://<databaseHost>:5432/ConfigHubPSQL
```

And you may specify parameters from the `/confighub-<version>/confighub.sh`.  Shown are default values
which will be applied if these parameters are omited:
```
    -e ALLOCATED_MEMORY=4g
    -e HTTP_PORT=80
    -e HTTPS_PORT=443
    -e LOG_PATH=/var/log/confighub
    -e KEYSTORE_FILE=cert/confighub_default.jks
    -e KEYSTORE_ALIAS=confighub
    -e KEYSTORE_PASSWORD=confighub
```
