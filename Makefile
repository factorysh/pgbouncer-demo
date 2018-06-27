build:
	docker-compose build

test: test_pgbouncer test_get_auth test_direct

test_pgbouncer:
	docker-compose up -d pgbouncer
	docker-compose ps
	docker-compose run -e PGPASSWORD=toto client_pgbouncer \
		psql --tuples-only -h pgbouncer -U test_user test_db -c "SELECT 1+1;"

test_get_auth:
	docker-compose up -d postgresql
	docker-compose ps
	docker-compose run -e PGPASSWORD=super_secret client \
		psql --tuples-only -h postgresql -U pgbouncer test_db -c "SELECT * FROM pgbouncer.get_auth('test_user');"

test_direct:
	docker-compose up -d postgresql
	docker-compose ps
	docker-compose run -e PGPASSWORD=toto client \
		psql --tuples-only -h postgresql -U test_user test_db -c "SELECT 1+1;"


down:
	docker-compose down
