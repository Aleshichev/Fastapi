.PHONY: init init-migration down build run db-migrate test tox

run: build upgrade
	uvicorn src.main:app --reload

down:
	docker compose down

start:
	uvicorn src.main:app --reload

build:
	docker compose down
	sleep 2
	docker compose up -d
	sleep 2

migrate:
	alembic revision --autogenerate -m

upgrade:
	alembic upgrade head