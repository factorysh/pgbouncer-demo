FROM bearstech/debian:stretch

RUN apt-get update &&\
        apt-get install -y \
            gettext \
            gosu \
            pgbouncer \
    && rm -rf /var/lib/apt/lists/*

COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.tpl
COPY entrypoint /opt/entrypoint

EXPOSE 5432

ENTRYPOINT ["/opt/entrypoint"]
CMD ["/usr/sbin/pgbouncer",  "/etc/pgbouncer/pgbouncer.ini"]
