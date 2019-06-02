leanoteVersion=2.6.1
mongodbVersion=3.6.12-leanote

build: docker

docker:
	docker build -f Dockerfile -t jouyouyun/leanote:${leanoteVersion} .
	docker build -f Dockerfile.mongodb -t jouyouyun/mongodb:${mongodbVersion} .

docker-push:
	docker push jouyouyun/leanote:${leanoteVersion}
	docker push jouyouyun/mongodb:${mongodbVersion}
