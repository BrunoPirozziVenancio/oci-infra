# Projetos Ansible - Oracle Cloud Infrastructure (OCI)

Este diretório contém 6 projetos criados com Ansible para automação e provisionamento de ambientes na Oracle Cloud Infrastructure (OCI).  
Os playbooks foram desenvolvidos com foco prático, compatíveis com VMs Ubuntu 22.04.5 LTS e Oracle Linux 9.6, usando autenticação por chave SSH.

---

## Projetos

### 1. `oci-create-user-ssh/`
Cria um novo usuário na VM com chave pública SSH e acesso sudo sem senha.

**Principais tarefas:**
- Criação de usuário
- Configuração do `.ssh/authorized_keys`
- Permissões seguras
- Sudo sem senha (opcional)

---

### 2. `oci-install-zabbix-agent/`
Instala e configura o agente Zabbix (6.4) para monitoramento remoto da instância.

**Principais tarefas:**
- Adição do repositório oficial do Zabbix
- Instalação do agente
- Configuração do IP do servidor Zabbix
- Ativação do serviço

---

### 3. `oci-configure-firewall/`
Configura o firewall da instância, detectando o sistema operacional automaticamente.

**Ubuntu:** usa **UFW**  
**Oracle Linux:** usa **firewalld**

**Permissões incluídas:**
- SSH (22)
- HTTP (80)
- HTTPS (443)

---

### 4. `oci-install-docker/`
Instala Docker e Docker Compose na instância, de forma simples e direta.

**Principais tarefas:**
- Instalação do Docker (via apt ou yum)
- Ativação do serviço
- Download da versão mais recente do Docker Compose

---

### 5.  `oci-deploy-app-node/`
Faz deploy de um app Node.js clonado de um repositório Git.

**Fluxo:**
- Clona o repositório
- Instala Node.js 18.x (via NodeSource)
- Executa `npm install` e sobe o app com `npm start`

---

### 6.  `oci-nginx-hardening-monitoring/`
Instala e configura o Nginx como proxy reverso com segurança reforçada e monitoração via Fail2Ban.

**Inclui:**
- Proxy para apps (ex: Node.js)
- Headers de segurança (XSS, HSTS, etc.)
- Bloqueio de métodos HTTP suspeitos
- Fail2Ban para monitorar acessos suspeitos via logs

---

## Requisitos

- Ansible 2.14+  
- Acesso SSH com chave privada às VMs  
- Python instalado nas instâncias  
- Permissão de `sudo` para o usuário remoto

---

## Como rodar

```bash
ansible-playbook -i inventory.ini playbook.yml
