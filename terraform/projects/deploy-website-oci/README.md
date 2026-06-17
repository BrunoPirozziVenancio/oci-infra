# Deploy de Website na OCI com Terraform

Tutorial completo para subir um website na Oracle Cloud usando Terraform.

## Arquitetura

- VCN com subnet publica
- Instancia Compute com Nginx (shape A1.Flex - Always Free)
- Bucket Object Storage para arquivos
- Security List com HTTP e SSH liberados

## Pre-requisitos

- Terraform >= 1.0 instalado
- Conta OCI configurada
- Chave API OCI gerada em ~/.oci/
- Chave SSH gerada

## Passo 1 - Configurar OCI CLI

oci setup config

## Passo 2 - Criar arquivo terraform.tfvars

compartment_id      = "ocid1.compartment.oc1..xxx"
availability_domain = "xxxx:SA-SAOPAULO-1-AD-1"
image_id            = "ocid1.image.oc1.sa-saopaulo-1.xxx"
ssh_public_key      = "ssh-rsa AAAA..."
namespace           = "seu-namespace"

## Passo 3 - Provisionar

terraform init
terraform plan
terraform apply

## Passo 4 - Acessar o site

http://IP_PUBLICO_DA_INSTANCIA

## Passo 5 - Destruir

terraform destroy
