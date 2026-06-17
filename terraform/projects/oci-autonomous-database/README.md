# OCI Autonomous Database + Compute

Instancia Compute conectada ao Autonomous Database da Oracle (Always Free).

## Arquitetura

- VCN com subnet publica
- Instancia Compute com Oracle Instant Client instalado
- Autonomous Database OLTP (Always Free - 1 OCPU + 1TB)

## Diferenciais do Autonomous Database

- Gerenciamento automatico (patches, backups, tuning)
- Alta disponibilidade built-in
- Escala automatica de recursos
- Tier gratuito disponivel (Always Free)

## Como usar

### 1. Criar terraform.tfvars
compartment_id      = "ocid1.compartment.oc1..xxx"
availability_domain = "xxxx:SA-SAOPAULO-1-AD-1"
image_id            = "ocid1.image.oc1.sa-saopaulo-1.xxx"
ssh_public_key      = "ssh-rsa AAAA..."
db_admin_password   = "SenhaForte123#"

### 2. Provisionar
terraform init
terraform plan
terraform apply

### 3. Conectar ao banco via SQL*Plus na EC2
ssh -i chave.pem opc@IP_DA_INSTANCIA
sqlplus admin@APPDB_high

## Outputs

- adb_connection_string: String de conexao do banco
- adb_display_name: Nome do banco
- compute_public_ip: IP da instancia
- vcn_id: OCID da VCN

## Destruir

terraform destroy
