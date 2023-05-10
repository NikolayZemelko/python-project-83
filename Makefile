myname = $(whoami)

install:
	poetry install

lint:
	poetry run flake8 page_analyzer

dev:
	poetry run flask --app page_analyzer.app:app --debug run

PORT ?= 8000
start: create-db
	poetry run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer.app:app

create-db:
	psql railway < database.sql