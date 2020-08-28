
build: Dockerfile
	docker build -t radiusd:alpine .

build-nocache: Dockerfile
	docker build --no-cache -t radiusd:alpine .

tag:
	docker tag radiusd:alpine localhost:5000/radiusd:alpine
	docker tag radiusd:alpine scottylogan/radiusd:alpine

push:
	docker push localhost:5000/radiusd:alpine

dockerhub:
	docker push scottylogan/radiusd:alpine

