
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

run:
	docker run --rm --name itarch -p 8080:8080 -v /Users/swl/src/itlab/itarch/logs:/var/log -it --env-file test.env -h itarch.stanford.edu itarch:test
