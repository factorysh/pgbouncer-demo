test:
	docker-compose up -d postgresql
	docker-compose ps
	docker-compose run -e PGPASSWORD=super_secret client \
		psql -h postgresql -U pgbouncer test_db -c "SELECT * FROM pgbouncer.get_auth('test_user');"

down:
	docker-compose down
