# Load Balancer com duas VMs

Esse projeto cria duas instâncias com Nginx e configura um Load Balancer HTTP na Oracle Cloud usando Terraform.

## Estrutura do projeto

- `main.tf`: cria as duas VMs, o Load Balancer, os backends e o listener HTTP.
- `variables.tf`: define as variáveis do projeto.
- `cloud-init/script.yaml`: script que instala e inicia o Nginx.
- `outputs.tf`: mostra o IP do LB e os IPs privados das VMs.

## Como testar

1. Rode `terraform init` e `terraform apply`.
2. Copie o IP público do Load Balancer.
3. Acesse no navegador: `http://<IP_DO_LB>` e veja a resposta alternando entre as instâncias.

## Extras

- O health check do LB usa HTTP na porta 80 com rota `/`.
- O balanceamento usa o algoritmo `ROUND_ROBIN`.

