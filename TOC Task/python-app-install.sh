# Add repository
sudo -u vagrant helm repo add python-web-app https://omarsolimandev.github.io/Python-Reload-Counter-Helm-Chart/
# Install chart
sudo -u vagrant helm install my-reload-counter python-web-app/reload-counter --version 1.0.0

# App can be accessed on minikube ip : 30009