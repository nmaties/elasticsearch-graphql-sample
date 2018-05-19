all: run-elasticsearch

run-elasticsearch:
	docker-compose -f docker-compose.yml up --build -d elasticsearch
