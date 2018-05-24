Démo Pgbouncer
==============

Maquette pour PgBouncer : un client se connecte au bouncer qui se connecte à Postgresql.

Lancer Postgresql et son bouncer :

    docker-compose up -d pgbouncer

Lancer psql qui se connecte au bouncer :

    docker-compose run client

Licence
-------

3 terms BSD licence, ©2018 Mathieu Lecarme
