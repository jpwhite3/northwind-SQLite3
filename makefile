.PHONY: clean build run
.DEFAULT_GOAL := build


bootstrap:
	brew install sqlite
	brew install graphviz

clean:
	rm -rf ./dist
	mkdir ./dist

build: clean
	sqlite3 dist/northwind.db < src/create.sql > /dev/null
	sqlite3 dist/northwind.db < src/update.sql > /dev/null
	sqlite3 dist/northwind.db < src/report.sql

populate:
	python3 ./src/populate.py
	sqlite3 dist/northwind.db < src/report.sql

report:
	sqlite3 dist/northwind.db < src/report.sql
