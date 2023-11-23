# Ansible Linux Docker image

This Docker image allows to run Ansible from a Linux container. It supports Linux, Windows and MacOS target hosts.


## Pre-requsites
git
ansible
docker
docker-compose

## Build the image 
run "docker-compose up -d"

## check Running Containers
docker ps
## copy ansible folder to ansible-server-container
docker cp ansible/hosts ansible-server-container:/etc/ansible/hosts
docker cp ansible/playbook.yml ansible-server-container:/etc/ansible
docker cp ansible/ansible.cfg ansible-server-container:/etc/ansible/

## Execute playbook  in server container
docker exec ansible-server-container ansible-playbook /etc/ansible/playbook.yml -i /etc/ansible/hosts

# Remove the network and container
docker stop ansible-server-container ansible-node-container
docker rm ansible-server-container ansible-node-container
docker network rm ansible-linux-net (your network name as specified in docker-compose.yml file)

## DockerHub
- [sewani/ansible_linux](https://hub.docker.com/repository/docker/sewani/ansible_linux/general)
- [peco602/ansible-linux-docker](https://hub.docker.com/r/peco602/ansible-linux-docker)# Ansible-Linux-container
