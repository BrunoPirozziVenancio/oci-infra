# OCI Auto Setup - Zabbix Agent

Este projeto provisiona automaticamente uma instância na **Oracle Cloud Infrastructure (OCI)** utilizando **Terraform**, e realiza a instalação e configuração do **Zabbix Agent 6.4** via **Cloud-Init**, incluindo regras de firewall e otimizações de configuração.

## Recursos criados

- Instância Compute com imagem Ubuntu 22.04 LTS
- IP público (caso configurado)
- Instalação automática do Zabbix Agent
- Configuração do agente para conectar ao Zabbix Server
- Liberação da porta 10050 (Zabbix Agent)
- Configuração personalizada do `zabbix_agentd.conf`

---
## Pré-requisitos

- Conta na [Oracle Cloud](https://cloud.oracle.com/)
- Chave API configurada (tenancy/user OCID, fingerprint, chave privada)
- Terraform instalado em sua máquina
- Par de chaves SSH gerado (ou uso da padrão `~/.ssh/id_rsa.pub`)

---

## Como usar

### 1. Clone este repositório

```bash
git clone https://github.com/BrunoPirozziVenancio/DevOps-rep.git
cd DevOps-rep/OCI-especific/oci-auto-setup
```

### 2. Configure suas variáveis

Crie um arquivo terraform.tfvars baseado no exemplo:

```bash
tenancy_ocid = "ocid1.tenancy.oc1..."
user_ocid = "ocid1.user.oc1..."
fingerprint = "xx:xx:xx:xx:xx"
private_key_path = "~/.oci/oci_api_key.pem"
region = "sa-saopaulo-1"
availability_domain = "ABCk:SA-SAOPAULO-1-AD-1"
compartment_id = "ocid1.compartment.oc1..."
subnet_id = "ocid1.subnet.oc1..."
image_id = "ocid1.image.oc1..."
ssh_public_key_path = "~/.ssh/id_rsa.pub"
```
Você pode obter o image_id para Ubuntu 22.04 em Oracle Cloud Marketplace.


### 3. Inicialize e aplique

```bash
terraform init
terraform plan
terraform apply
```

Confirme com yes quando solicitado.

---

### Cloud-Init (userdata.sh)
O script userdata.sh será executado automaticamente ao criar a instância. Ele:

- Instala o Zabbix Agent 6.4
- Aponta para o IP do Zabbix Server
- Libera a porta 10050
- Adiciona parâmetros extras no zabbix_agentd.conf
- Gera log em /var/log/zabbix_agent_install.log

Lembre-se de editar o script e substituir IP_DO_SEU_ZABBIX_SERVER com o IP correto do seu servidor Zabbix.

---

## Outputs
O arquivo outputs.tf exporta:

- IP público da instância
- OCID da instância
  
Após o apply, será exibido no terminal algo como:

```bash
instance_public_ip = "152.67.XXX.XXX"
instance_id        = "ocid1.instance.oc1..."
```

---

### Destruir recursos
Quando terminar os testes:

```bash
terraform destroy
```
