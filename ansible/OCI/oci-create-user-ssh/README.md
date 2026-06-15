# Criação de Usuário Seguro com Chave SSH (OCI)

Este playbook do Ansible cria um usuário em uma VM da Oracle Cloud (OCI), configura acesso SSH com chave pública e (opcionalmente) adiciona o usuário ao sudo sem necessidade de senha. Ele também inclui um handler que reinicia o serviço SSH caso a configuração de sudoers seja alterada.

---

## O que o playbook faz

- Cria um novo usuário Linux com shell `/bin/bash`.
- Cria o diretório `.ssh` com permissões seguras.
- Adiciona uma chave pública ao `authorized_keys`.
- (Opcional) Concede permissão sudo sem senha.
- (Opcional) Reinicia o serviço SSH se o sudoers for alterado.

---

## Pré-requisitos

- Python instalado na máquina local
- Ansible instalado (`pip install ansible`)
- Chave SSH configurada para acesso à VM
- A VM da OCI deve permitir conexão via SSH

---

## Exemplo de inventário (`hosts.ini`)

```ini
[oci]
192.168.0.10 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/minha-chave.pem
```

---

## Como usar  

- Edite o playbook criar_usuario.yml e altere as variáveis:  

  -> novo_usuario: nome do usuário a ser criado.  
  -> chave_ssh_publica: chave pública que será adicionada.  
  -> permitir_sudo_sem_senha: true para permitir sudo sem senha.  

### Execute o playbook:

```bash
ansible-playbook -i inventario/hosts.ini playbook/criar_usuario.yml
```

---

## Explicações extras

- Handlers: O serviço SSH só será reiniciado se o sudoers do novo usuário for alterado.  

- Permissões: O .ssh e authorized_keys têm permissões seguras (0700 e 0600).  

- Ternário no shell: Garante que /bin/bash exista, senão usa /bin/sh.  

### Segurança  

- A permissão de sudo sem senha é opcional.

- O playbook segue boas práticas de permissionamento SSH.

- Use chaves públicas seguras (evite copiar de qualquer lugar).

---

### Exemplo de saída esperada  

```bash
TASK [Criar o usuário] *******************************************************
changed: [192.168.0.10]
```

```bash
TASK [Criar diretório .ssh] *************************************************
changed: [192.168.0.10]
```

```bash
TASK [Adicionar chave pública] **********************************************
changed: [192.168.0.10]
```

```bash
TASK [Configurar sudo] ******************************************************
changed: [192.168.0.10]
```
