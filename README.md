# sewani/ansible_linux Docker image

This Docker image allows to run Ansible from a ubuntu container..


## Pre-requsites
ansible
docker
docker-compose

## Build the image 
run "docker-compose up -d"

## check Running Containers
docker ps

## copy ansible hosts file to ansible-server-container
docker cp ansible/hosts ansible-server-container:/etc/ansible/hosts

## copy ansible playbook to ansible-server-container
docker cp ansible/playbook.yml ansible-server-container:/etc/ansible

## copy ansible.cfg file to ansible-server-container
docker cp ansible/ansible.cfg ansible-server-container:/etc/ansible/

## Execute playbook  in server container
docker exec ansible-server-container ansible-playbook /etc/ansible/playbook.yml -i /etc/ansible/hosts

## Stop the containers
docker stop ansible-server-container ansible-node-container

## Remove the containers
docker rm ansible-server-container ansible-node-container

## Remove the network
docker network rm ansible-linux-net (your network name as specified in docker-compose.yml file)

## DockerHub
- [sewani/ansible_linux](https://hub.docker.com/repository/docker/sewani/ansible_linux/general)

## Image
![Image](https://github.com/Anujsewani/Ansible-Linux-container/blob/main/ansible%20linux.png)
