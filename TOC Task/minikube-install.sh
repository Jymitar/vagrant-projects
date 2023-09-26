
# To install the latest minikube stable release on x86-64 Linux using Debian package:
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

#Add user to docker grp:
sudo usermod -aG docker vagrant && newgrp docker

# Start the minikube
sudo -u vagrant minikube start