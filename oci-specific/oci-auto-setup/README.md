# OCI Auto Setup com Terraform + Cloud-Init
Este projeto automatiza a criação de uma instância na Oracle Cloud Infrastructure (OCI), que já vem configurada com:

- Java 22
- MySQL Server
- ginx

-> O provisionamento é feito com Terraform, e a configuração da máquina usa Cloud-Init.

-> OCI CLI configurado (para pegar os OCIDs)

-> Chave SSH (pública)

-> Terraform instalado (v1.1+)

---

## Como usar

### 1. Clone o projeto

```bash
git clone https://github.com/BrunoPirozziVenancio/DevOps-rep/OCI-especific/oci-auto-setup.git
cd oci-auto-setup
```

### 2. Configure suas variáveis
-> Crie um arquivo chamado terraform.tfvars com base no terraform.tfvars.example:

```bash
region = "sa-saopaulo-1"
availability_domain = "kZCp:SA-SAOPAULO-1-AD-1"
compartment_id = "ocid1.compartment.oc1..xxxxx"
subnet_id = "ocid1.subnet.oc1..xxxxx"
image_ocid = "ocid1.image.oc1..xxxxx"                                  # Recomendado: Ubuntu 22.04
ssh_public_key_path = "~/.ssh/id_rsa.pub"
```

Use `oci os image list --all` para descobrir o OCID da imagem Ubuntu, se precisar.

### 3. Inicialize e aplique

```bash
terraform init
terraform apply
```

Confirme com yes quando solicitado.

### 4. Acesse sua instância
Após a criação, o terminal mostrará o IP público. Use-o para se conectar via SSH:

```bash
ssh ubuntu@<ip_publico>
```

---

## O que é instalado na instância?

- Java 22: via .deb oficial da Oracle.
- MySQL Server: via apt.
- Nginx: via apt.

Tudo é iniciado automaticamente com systemctl.

---

### Exemplo de uso  
-> Você pode adaptar este projeto para instalar outras stacks, como:

- Docker + Docker Compose
- Zabbix Agent
- Aplicações customizadas (Node.js, Java, etc.)

---

### Segurança

- Apenas a chave pública definida em ssh_public_key_path terá acesso.
- Use firewall em nuvem (Security Lists ou NSGs) para limitar o acesso externo, se necessário.

### Saídas

```bash
instance_public_ip – IP público da instância
```

```bash
instance_private_ip – IP interno
```

```bash
instance_id – OCID da instância criada
```
