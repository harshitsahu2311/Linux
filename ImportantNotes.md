## Git command
git remote -v ----> this tells us at present git remote is pointing to which directory <br/>
git remote set-url origin <repo-url> -------> to change the git pointer to this url<br/>

## Steps for Kubernetes Installation
```sh
apt install docker.io
```
```sh
newgrp docker
```
```sh
sudo chmod 777 /var/run/docker.sock
```
```sh
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```
```sh
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
```sh
which minikube
```
```sh
minikube start --driver docker
```
```sh
kubectl get po -A
```
```sh
sudo snap install kubectl
```
```sh
sudo snap install kubectl --classic
```
```sh
kubectl get po -A
```

