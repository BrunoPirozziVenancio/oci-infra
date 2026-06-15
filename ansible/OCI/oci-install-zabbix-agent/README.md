# Instalação do Agente Zabbix na OCI

Este playbook instala e configura o agente Zabbix em instâncias OCI rodando Ubuntu 22.04 ou Oracle Linux 9.

## O que ele faz

- Atualiza o cache dos pacotes
- Instala dependências necessárias (curl, gnupg)
- Adiciona o repositório oficial do Zabbix
- Instala o agente Zabbix
- Configura o arquivo `zabbix_agentd.conf` com o IP do servidor Zabbix
- Habilita e inicia o serviço do agente

## Como usar

1. Atualize o `inventory.ini` com o IP e chave SSH.
2. Configure a variável `zabbix_server_ip` no `playbook.yml` para o IP do seu servidor Zabbix.
3. Rode o playbook:

```bash
ansible-playbook -i inventory.ini playbook.yml
```
---
Obs.: Altamente recomendado fazer o teste em um ambiente de Homolog (homologação)
