## Deployment procedure for local development

First make sure you create .env file in root folder and fill it correspondingly. You could use `host.docker.internal` as host for DB if you are planning to use local mysql instead of container.

1. Before running docker commands run `docker/run_before_build.sh` to generate ini and conf files, then change them if needed. Look inside docker/run_before_build.sh to see what files are generated
2. Uncomment port mappings that you need, at least uncomment news-app1 88:80 mapping for local development, uncomment volume mappings for app. Do not map volume both for news-app, this produces inconsistency
3. For Mac M1 silicon uncomment platform: linux/x86_64 in news-app-mysql. You can also use local MYSQL and set DB_HOST=host.docker.internal in .env file
4. `sh docker/docker.sh`,to startup
