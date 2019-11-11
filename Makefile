all:
	docker build -t pressly/kube-deploy:latest .
	docker push pressly/kube-deploy:latest