up:
	docker-compose up -d
build:
	docker-compose build
install:
	./wordpress/wp-install.sh
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
restart:
	@make down
	@make up
setup:
	@make build
	@make up
	@make install
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker-compose down --volumes --remove-orphans
	rm -rf ./db
	rm -rf ./html
ps:
	docker-compose ps
logs:
	docker-compose logs
logs-watch:
	docker-compose logs --follow
log-web:
	docker-compose logs web
log-web-watch:
	docker-compose logs --follow web
log-db:
	docker-compose logs db
log-db-watch:
	docker-compose logs --follow db
web:
	docker-compose exec web bash
db:
	docker-compose exec db bash
sql:
	docker-compose exec db bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'
createuser:
	docker compose run --rm cli wp user create $$WP_USER $$WP_ADMINMAIL --role=administrator --user_pass="$$WP_PASSWORD"
