# Projeto OCI - Instância com Cloud-Init

Esse projeto cria uma instância Oracle Cloud Infrastructure (OCI) usando Terraform, que executa um script Cloud-Init para instalar e iniciar o Nginx junto com alguns pacotes úteis.

## Estrutura do projeto

- **main.tf:** define o recurso principal da instância OCI e carrega o script Cloud-Init.
- **variables.tf:** variáveis usadas no projeto para facilitar customização.
- **outputs.tf:** outputs para exibir o OCID e o IP público da instância criada.
- **cloud-init/script.yaml:** script de inicialização que instala pacotes, incluindo o Nginx, e configura a página inicial.

## Como usar

1. Configure suas variáveis em um arquivo `terraform.tfvars` ou passe via linha de comando.
2. Execute:
   ```bash
   terraform init
   terraform plan
   terraform apply
   
3. Após a criação, acesse o IP público da instância para ver a página padrão do Nginx customizada pelo Cloud-Init.
