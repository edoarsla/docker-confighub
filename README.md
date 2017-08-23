# Docker Config Hub
A docker image for [Config Hub](https://www.confighub.com/).

### Available environment variables
This image assumes you will use the same MySQL service for both databases; otherwise you will need to extend this image and copy your own `tomee.xml` file in.

You will need to configure environment variables `DB_USERNAME` and `DB_PASSWORD`, and your service will need the databases `ConfigHubMain` and `ConfigHubClientRequests` to exist already. This image assumes you will link, or alias the service on the network as `db`.

You can also override the following defaults:
```
DB_DRIVER=com.mysql.jdbc.Driver
DB_URL=jdbc:mysql://db:3306
```
