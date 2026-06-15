# Instalação do Docker e Docker Compose com Ansible (OCI)

Este playbook Ansible instala o **Docker** e o **Docker Compose** em VMs da Oracle Cloud Infrastructure (OCI), suportando tanto **Ubuntu** quanto **Oracle Linux**. Ele detecta automaticamente o sistema operacional e executa os passos adequados para cada distribuição.

---

## O que o playbook faz

- Atualiza o cache dos pacotes (`apt` ou `yum`).
- Instala as dependências e repositórios do Docker.
- Instala o Docker em sua versão estável.
- Inicia e habilita o serviço Docker.
- Faz o download da versão mais recente do Docker Compose.
- Verifica e exibe a versão do Docker Compose instalada.

---

## Exemplo de inventário (`hosts.ini`)

```ini
[oci]
192.168.0.10 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/minha-chave.pem
```

## Como executar  

```bash
ansible-playbook -i inventario/hosts.ini playbook/instalar_docker.yml
```

---

### Observações  

- O Docker Compose é instalado diretamente do repositório oficial no GitHub via get_url.

- A versão instalada é a mais recente no momento da execução.

- O playbook usa o comando docker-compose --version para validar a instalação.

- O serviço Docker é iniciado e habilitado automaticamente no boot.

### Requisitos  

- Permissões sudo no host remoto.

- Chave SSH válida para autenticação.

- Ansible instalado localmente.
  
---

### Exemplo de saída esperada

```bash
TASK [Instalar Docker (Ubuntu)] ******************************************
changed: [192.168.0.10]
```

```bash
TASK [Instalar Docker Compose (versão estável mais recente)] ************
changed: [192.168.0.10]
```

```bash
TASK [Mostrar versão do Docker Compose instalada] ***********************
ok: [192.168.0.10] => {
    "msg": "Docker Compose version v2.24.5"
}
```
