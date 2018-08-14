DBNAME:=treasure
ENV:=development

mysql:
	mysql -u root -h localhost -P 3306 --protocol=tcp -p

deps:
	which dep || go get -v -u github.com/golang/dep/cmd/dep
	dep ensure 
	go get github.com/rubenv/sql-migrate/...

test:
	go test -v ./...

integration-test:
	go test -v ./... -tags=integration

run:
	go run cmd/base.go

migrate/init:
	mysql -u root -h localhost --protocol tcp -e "create database \`$(DBNAME)\`" -p

migrate/up:
	sql-migrate up -env=$(ENV)

migrate/down:
	sql-migrate down -env=$(ENV)

migrate/status:
	sql-migrate status -env=$(ENV)

migrate/dry:
	sql-migrate up -dryrun -env=$(ENV)

docker/start: docker-compose.yml
	docker-compose up -d

docker/stop:
	docker-compose stop

docker/logs:
	docker-compose logs

docker/clean:
	docker-compose rm

docker/bash:
	docker exec -it $(shell docker-compose ps -q) bash
