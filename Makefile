build:
	docker build . -t huacnlee/rails-docker-build:latest
push:
	docker push huacnlee/rails-docker-build:latest