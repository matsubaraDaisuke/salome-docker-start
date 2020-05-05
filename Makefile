IP:
	networksetup -getinfo Wi-Fi | grep "^IP address:"

build:
	docker-compose up --build

run: 
	docker-compose run openmodelica /bin/bash