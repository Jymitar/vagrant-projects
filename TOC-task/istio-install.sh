# install istio using HELM - Initial setup

# Configure the Helm repository:
sudo -u vagrant helm repo add istio https://istio-release.storage.googleapis.com/charts
sudo -u vagrant helm repo update

# Create a namespace istio-system for Istio components:
sudo -u vagrant kubectl create namespace istio-system

# Install the Istio base chart which contains cluster-wide resources used by the Istio control plane:
sudo -u vagrant helm install istio-base istio/base -n istio-system --set defaultRevision=default
sudo -u vagrant helm install istiod istio/istiod -n istio-system --wait

# Label the default namespace with istio-injection=enabled. Pods in the default namespace will be injected with istio proxy that listens to all traffic
sudo -u vagrant kubectl label namespace default istio-injection=enabled --overwrite
# kubectl get namespace -L istio-injection

# Installing ingressgateway
sudo -u vagrant kubectl create namespace istio-ingress
sudo -u vagrant kubectl label namespace istio-ingress istio-injection=enabled
sudo -u vagrant helm install istio-ingressgateway istio/gateway -n istio-ingress