#! /bin/bash
export PATH=~/istio/bin:$PATH
cd ~/istio
istioctl manifest apply --set profile=demo

kubectl label namespace default istio-injection=enabled
kubectl apply -f ~/istio/samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f ~/istio/samples/bookinfo/networking/bookinfo-gateway.yaml 
cp ~/.kube/config ~/istio/config-kube
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}')
echo http://$GATEWAY_URL/productpage
# para ligar o kiali - > istioctl dashboard kiali --address 0.0.0.0
