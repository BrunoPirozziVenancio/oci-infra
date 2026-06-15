# Configuração de Firewall com Ansible para OCI (Ubuntu e Oracle Linux)

Este playbook automatiza a configuração básica de firewall em VMs Oracle Cloud Infrastructure (OCI), detectando se o sistema operacional é Ubuntu (Debian) ou Oracle Linux (RedHat) e aplicando as regras apropriadas para cada ambiente.

---

## O que o playbook faz

- Instala e configura o **UFW** no Ubuntu, liberando as portas SSH (22), HTTP (80) e HTTPS (443).
- Instala e configura o **firewalld** no Oracle Linux, liberando os mesmos serviços/portas.
- Ativa o firewall e aplica as regras automaticamente.
- Detecta o sistema operacional automaticamente para aplicar as configurações corretas.

---
## Pré-requisitos

- Máquina local com Ansible instalado.
- Acesso SSH às VMs OCI com permissão para usar `sudo`.
- Inventário Ansible configurado com o grupo `oci`.

---

## Exemplo de inventário (`hosts.ini`)

```ini
[oci]
192.168.0.10 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/minha-chave.pem
```
---

## Como usar  

Garanta que seu inventário está correto e você consegue conectar via SSH.

### Execute o playbook:

```bash
ansible-playbook -i inventario/hosts.ini playbook/configurar_firewall.yml
```

--- 

### Considerações de segurança

- O playbook libera as portas básicas para SSH, HTTP e HTTPS. Ajuste conforme sua necessidade.

- O firewall será ativado e configurado automaticamente.

- Use chaves SSH seguras para acesso.

### Saída esperada (exemplo)

```bash
TASK [Instalar UFW (Ubuntu)] ******************************************
changed: [192.168.0.10]
```

```bash
TASK [Permitir SSH no UFW] *********************************************
changed: [192.168.0.10]
```

```bash
TASK [Ativar UFW] ******************************************************
changed: [192.168.0.10]
```
