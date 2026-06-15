OCI | VCN + Instância

Projeto criado pra automatizar a criação de uma estrutura base na Oracle Cloud:

- VCN (rede virtual)
- Subnet pública
- Internet Gateway
- Tabela de rotas
- Instância Oracle Linux 8 (grátis)

---

## Pré-requisitos

- Conta ativa na [OCI](https://cloud.oracle.com/)
- Chave API criada e configurada localmente
- Terraform 1.2 ou superior instalado

---

## Como usar

Crie um arquivo `terraform.tfvars` com suas variáveis:

```hcl
tenancy_ocid     = "ocid1.tenancy.oc1..."
user_ocid        = "ocid1.user.oc1..."
fingerprint      = "xx:xx:xx:xx:xx"
private_key_path = "~/.oci/oci_api_key.pem"
region           = "sa-saopaulo-1"
compartment_ocid = "ocid1.compartment.oc1..."
ssh_public_key   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ..."
```
Depois é só rodar:

```bash
terraform init
terraform apply
```
