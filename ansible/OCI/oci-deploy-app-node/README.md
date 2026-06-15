# ansible-oci-nodejs-deploy

Este projeto Ansible realiza o deploy automatizado de uma aplicação Node.js em uma instância na Oracle Cloud Infrastructure (OCI), seja com Ubuntu 22.04 ou Oracle Linux 9. Ele instala todas as dependências, clona o repositório da aplicação e executa o servidor.

---
## O que esse playbook faz?

1. **Instala `curl` e `git`**, dependendo do sistema operacional.
2. **Instala o Node.js 18.x** com o repositório oficial da NodeSource.
3. **Clona uma aplicação Node.js** de exemplo do GitHub.
4. **Instala as dependências da aplicação** com `npm install`.
5. **Inicia a aplicação** com `nohup npm start &`.

---

## Pré-requisitos

- Instância na OCI (Ubuntu ou Oracle Linux)
- SSH configurado via chave
- Python e Ansible instalados na sua máquina local
- Acesso à internet a partir da VM (para instalar pacotes e clonar repositório)

---

##  Como usar

### 1. Configure o inventário

No seu arquivo `inventory`, coloque o IP público da sua VM:

```ini
[oci]
192.0.2.10 ansible_user=opc ansible_ssh_private_key_file=~/.ssh/oci_key.pem
```   

Obs: Altere ansible_user para ubuntu se for Ubuntu.

### 2. Execute o playbook

```ini
ansible-playbook -i inventory playbook.yml
```

## Variáveis configuráveis  

Você pode alterar diretamente no playbook.yml:

```bash
repo_url: "https://github.com/heroku/node-js-sample.git"  # Repositório da aplicação
app_dir: "/opt/node-app"                                  # Caminho de destino na VM
```

### Resultado  
Após a execução, a aplicação estará rodando em segundo plano, escutando por padrão na porta 5000.

- Acesse no navegador:

```bash
http://<ip-da-vm>:5000
```

### Segurança  

O playbook usa become: true para operações administrativas com sudo.

Você pode adaptar com handlers, firewall, usuários e mais para produção.

