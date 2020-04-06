#!/bin/bash +xe
echo "Installing Docker (CE) on Selenium Grid Ubuntu 18.04 host"
lsb_release -r

apt update -y
apt-get remove -y docker docker-engine docker.io containerd runc
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

usermod -aG docker $(whoami)

which docker
docker --version

echo vm.max_map_count=262144 >> /etc/sysctl.conf
sysctl -w vm.max_map_count=262144

#docker container run hello-world

echo '# To execute this docker-compose yml file use `docker-compose -f <file_name> up`
# Add the `-d` flag at the end for detached execution
version: '2'
services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.4.2
    environment:
      discovery.type: single-node
    ports:
      - 9200:9200
      - 9300:9300
    volumes:
      - esdata1:/usr/share/elasticsearch/data:rw
    ulimits:
      nofile:
       soft: 65536
       hard: 65536

  kibana:
    image: docker.elastic.co/kibana/kibana:7.4.2
    environment:
      ELASTICSEARCH_URL: http://elasticsearch:9200
    ports:
      - 5601:5601
    volumes:
      - kibana_es_data:/usr/share/elasticsearch/data

volumes:
  kibana_es_data:
  esdata1:' > docker-compose.yml

docker-compose up -d
