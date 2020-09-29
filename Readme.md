Cria através do vagrant e do Virtual box um cluster kubernetes simples com 1 master e dois nodes para treinamento.
Foi testado em SO Windows 10. 
A instalação é feita como o kubeadm e automatizada através do ansible

Pre-requisitos:

* Vagrant 
* Virtual Box

Caso seja utilizado apenas o ansible, é necessário ajustar os IP´s em ./ansible/playbooks/group_vars

