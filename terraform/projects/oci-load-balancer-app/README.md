# Load Balancer com 2 Instancias na OCI

Load Balancer distribuindo trafego entre 2 instancias Compute com Nginx.

## Arquitetura

- VCN com subnet publica
- 2 instancias Compute com Nginx
- Load Balancer flexible com politica Round Robin
- Health Check automatico nas instancias

## Como funciona

O Load Balancer recebe o trafego na porta 80 e distribui entre os 2 servidores.
Cada servidor responde com seu proprio nome, demonstrando o balanceamento.
Se um servidor cair, o health check detecta e para de enviar trafego para ele.

## Como usar

terraform init
terraform plan
terraform apply

## Outputs

- load_balancer_ip: IP do Load Balancer
- load_balancer_url: URL para acessar
- server1_ip: IP privado do servidor 1
- server2_ip: IP privado do servidor 2

## Destruir

terraform destroy
