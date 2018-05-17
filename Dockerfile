FROM bearstech/debian:stretch

RUN apt-get update &&\
        apt-get install -y \
            gettext \
            pgbouncer \
    && rm -rf /var/lib/apt/lists/*

COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.tpl
COPY entrypoint /opt/entrypoint

USER postgres
EXPOSE 5432

ENTRYPOINT ["/opt/entrypoint"]
CMD ["pgbouncer",  "/etc/pgbouncer/pgbouncer.ini"]
