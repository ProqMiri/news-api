FROM mysql:8

RUN mv /etc/localtime /etc/localtime.bak && ln -s /usr/share/zoneinfo/Asia/Baku /etc/localtime

COPY docker/mysql/conf/mysql.cnf /etc/mysql/conf.d/mysql.cnf

COPY docker/mysql/index.sh ./index.sh
RUN chmod u+x ./index.sh && ./index.sh && rm ./index.sh

