.PHONY: init init-migration down build run db-migrate test tox

run: build upgrade
	uvicorn main:app --reload

down:
	docker compose down

start:
	uvicorn main:app --reload

build:
	docker compose up -d
	sleep 2

migrate:
	alembic revision --autogenerate -m

upgrade:
	alembic upgrade head