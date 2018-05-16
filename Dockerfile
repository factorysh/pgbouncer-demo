FROM bearstech/debian:stretch

RUN apt-get update &&\
        apt-get install -y \
            gettext \
            pgbouncer \
    && rm -rf /var/lib/apt/lists/*

COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.tpl

USER postgres

CMD envsubst < /etc/pgbouncer/pgbouncer.tpl > /etc/pgbouncer/pgbouncer.ini &&\
    echo '"${USER}" "${PASSWORD}"' > /etc/pgbouncer/userlist.txt &&\
    pgbouncer /etc/pgbouncer/pgbouncer.ini
