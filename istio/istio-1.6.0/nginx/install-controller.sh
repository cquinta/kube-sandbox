#! /bin/bash
echo " Clonado o projeto"

git clone https://github.com/nginxinc/kubernetes-ingress/
cd kubernetes-ingress/deployments
git checkout v1.8.1

echo "Criando namespace e conta de serviço"
kubectl apply -f common/ns-and-sa.yaml

echo "Criando role e rolebinding"
kubectl apply -f rbac/rbac.yaml

echo " Criando Secret com certificado TLS"

kubectl apply -f common/default-server-secret.yaml

echo " Criando configmap para parametrização"
kubectl apply -f common/nginx-config.yaml

echo "Criando Virtual Server e VServer Route e serviço de Transporte"
kubectl apply -f common/vs-definition.yaml
kubectl apply -f common/vsr-definition.yaml
kubectl apply -f common/ts-definition.yaml
kubectl apply -f common/policy-definition.yaml

echo "Criando configuração global"
kubectl apply -f common/gc-definition.yaml
echo "Criando Global Resource"
kubectl apply -f common/global-configuration.yaml

echo "Deployando o Ingress Controller em um daemonset"
kubectl apply -f daemon-set/nginx-ingress.yaml

echo "Ingress entregue no namespace nginx-ingress"

cd ..
#echo "o exemplo"
kubectl create -f  examples/complete-example/cafe.yaml -n nginx-ingress
kubectl create -f  examples/complete-example/cafe-secret.yaml -n nginx-ingress
kubectl create -f  examples/complete-example/cafe-ingress.yaml -n nginx-ingress
