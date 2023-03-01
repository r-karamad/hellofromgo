.PHONY: docker certificate tests

docker: ## Prepare docker environment
	sudo apt update
	sudo apt install apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
	apt-cache policy docker-ce
	sudo apt install docker-ce
	sudo usermod -aG docker ${USER}
	su - ${USER}
	sudo usermod -aG docker ubuntu

certificate: ## Generate self-signed certificate
	openssl req -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365

tests:
	curl --insecure -s -o /dev/null -w "%{http_code}" https://ec2-3-71-23-4.eu-central-1.compute.amazonaws.com/ | grep -q 200
	curl --insecure -s -o /dev/null -w "%{http_code}" https://ec2-3-71-23-4.eu-central-1.compute.amazonaws.com/home | grep -q 200
	curl --insecure -s -o /dev/null -w "%{http_code}" https://ec2-3-71-23-4.eu-central-1.compute.amazonaws.com/shopping | grep -q 200
