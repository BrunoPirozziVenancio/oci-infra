# Nginx com Hardening e Monitoramento (Fail2Ban)

Este playbook realiza a instalação e configuração do Nginx com proxy reverso para uma aplicação backend (como um app Node.js), aplicando práticas de **hardening** (segurança) e configurando o **Fail2Ban** para proteção contra tentativas de ataque (como brute force).

## O que este playbook faz

- Instala o **Nginx** (compatível com Ubuntu e Oracle Linux)
- Cria um arquivo de configuração com:
  - Proxy reverso para a porta da aplicação backend
  - Headers de segurança (hardening)
  - Bloqueio de métodos HTTP perigosos
  - Ocultação da versão do Nginx
- Ativa o novo site no Nginx e remove o default (no Ubuntu)
- Instala e ativa o **Fail2Ban** para segurança adicional

## Como usar  
Defina suas variáveis no próprio playbook:

```bash
vars:
  app_backend_port: 5000        # Porta onde sua aplicação está rodando
  server_name: "_"            # Pode ser IP público ou domínio
```

### Execute o playbook:

```bash
ansible-playbook -i inventario nginx-secure.yml
```

### Exemplo de inventário:

```bash
[oci]
seu_ip_ou_hostname_ansible_user=ubuntu
```

---

### Recursos de segurança aplicados

- Headers HTTP seguros: previnem ataques de injeção, clickjacking e força SSL/TLS.

- Bloqueio de métodos HTTP perigosos: apenas GET, POST e HEAD são permitidos.

- Ocultação da versão do Nginx: impede que o atacante saiba qual versão está sendo usada.

- Fail2Ban: bloqueia IPs com tentativas repetidas de login ou exploração.

---

### Requisitos
- Ansible instalado localmente

- Acesso SSH com chave para as instâncias OCI (Ubuntu ou Oracle Linux)

- Liberação da porta 80 no firewall da OCI

### Notas
- Este playbook cobre tanto Ubuntu (via apt) quanto Oracle Linux (via yum).

- O Fail2Ban é instalado e ativado, mas você pode adicionar jail personalizada para proteger outros serviços além do SSH (como o próprio Nginx).

- O hardening é feito diretamente no arquivo app.conf dentro de /etc/nginx/sites-available/.
