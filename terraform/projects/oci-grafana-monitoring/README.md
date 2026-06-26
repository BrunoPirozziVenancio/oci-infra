# Monitoramento de Infraestrutura com Grafana na OCI

Projeto completo de observabilidade monitorando 5 servidores na Oracle Cloud com Prometheus, Node Exporter e Grafana.

Este projeto faz parte de uma serie de 3 implementacoes do mesmo sistema de monitoramento em ambientes diferentes. O dashboard e identico nas 3 versoes, o que muda e onde a infraestrutura roda:

- docker-labs/docker-compose/grafana-monitoring: tudo roda localmente via Docker Compose, ideal para testes e estudo
- aws-infra/terraform/aws-grafana-monitoring: os servidores sao instancias EC2 reais na AWS
- oci-infra/terraform/projects/oci-grafana-monitoring (este projeto): os servidores sao instancias Compute reais na OCI

## Arquitetura

- 1 instancia Compute de banco de dados
- 1 instancia Compute proxy (Nginx reverse proxy)
- 3 instancias Compute backend (aplicacao)
- 1 instancia Compute de monitoramento (Prometheus + Grafana)

Todas as instancias usam o shape VM.Standard.A1.Flex (Always Free).

## Metricas monitoradas

- Disponibilidade de cada servidor (up/down)
- CPU: percentual de uso e load average (1m, 5m, 15m)
- RAM: percentual de uso, total, usada e disponivel
- Disco: percentual de uso, leitura/escrita em bytes/s e IOPS
- Rede: trafego de entrada e saida em bytes/s
- Sistema: uptime, processos rodando e conexoes abertas

## Pre-requisitos

- Terraform >= 1.0 instalado
- Ansible instalado
- OCI CLI configurado em ~/.oci/
- Chave SSH gerada

## Passo 1 - Criar terraform.tfvars

tenancy_ocid        = "ocid1.tenancy.oc1..xxx"
user_ocid           = "ocid1.user.oc1..xxx"
fingerprint         = "xx:xx:xx:xx"
compartment_id      = "ocid1.compartment.oc1..xxx"
availability_domain = "xxxx:SA-SAOPAULO-1-AD-1"
image_id            = "ocid1.image.oc1.sa-saopaulo-1.xxx"
ssh_public_key      = "ssh-rsa AAAA..."

## Passo 2 - Provisionar a infraestrutura

terraform init
terraform plan
terraform apply

## Passo 3 - Preencher o inventory do Ansible

Copie os IPs gerados nos outputs do Terraform e preencha o arquivo ansible/inventory.ini.

## Passo 4 - Instalar Node Exporter, Prometheus e Grafana

ansible-playbook -i ansible/inventory.ini ansible/playbook.yml

## Passo 5 - Acessar o Grafana

http://IP_DO_SERVIDOR_MONITORAMENTO:3000

Login:
- Usuario: admin
- Senha: admin

## Passo 6 - Destruir

terraform destroy

## Tecnologias

- Terraform: provisionamento das instancias na OCI
- Ansible: instalacao e configuracao do Node Exporter, Prometheus e Grafana
- Prometheus: coleta de metricas
- Node Exporter: exporta metricas do sistema operacional
- Grafana: visualizacao dos dashboards
