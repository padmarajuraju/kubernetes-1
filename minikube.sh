#!/bin/bash


sudo apt-get update -y 

sudo apt-get install openjdk-11-jdk -y

sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 
sudo install minikube-linux-amd64 /usr/local/bin/minikube 

sudo apt-get install docker.io -y 
sudo apt-get update -y

sudo usermod -aG docker $USER 
newgrp docker

sudo apt-get update -y
sudo systemctl enable docker
sudo systemctl start docker

minikube config set cpus 2
minikube config set memory 3999

minikube start --force

sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
