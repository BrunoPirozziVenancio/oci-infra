# Configuração automática para instalação do Zabbix Agent


# Atualiza os repositórios e pacotes existentes

package_update: true
package_upgrade: true

runcmd:
  - echo "Instalando o Zabbix Agent 6.4 para Ubuntu 22.04"
  - wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb -O /tmp/zabbix-release.deb
  - dpkg -i /tmp/zabbix-release.deb
  - apt update
  - apt install -y zabbix-agent              # Instala o pacote do agent
  

  # Configura o arquivo principal do Zabbix Agent
  
  - echo "Configurando o agente para apontar para o servidor Zabbix"
  - sed -i 's/^Server=127.0.0.1/Server=IP_DO_SEU_ZABBIX_SERVER/' /etc/zabbix/zabbix_agentd.conf                  # IP do servidor Zabbix
  - sed -i 's/^ServerActive=127.0.0.1/ServerActive=IP_DO_SEU_ZABBIX_SERVER/' /etc/zabbix/zabbix_agentd.conf        # Para checks ativos
  - sed -i "s/^Hostname=Zabbix server/Hostname=$(hostname)/" /etc/zabbix/zabbix_agentd.conf                      # Usa o hostname da máquina
  - echo "Timeout=30" >> /etc/zabbix/zabbix_agentd.conf                                                         # Aumenta timeout padrão
  - echo "EnableRemoteCommands=1" >> /etc/zabbix/zabbix_agentd.conf                                            # Permite comandos remotos


  # Libera a porta do Zabbix Agent no firewall
  
  - echo "Configurando firewall"
  - ufw allow 10050/tcp  


  # Inicia e configura inicialização automática
  
  - echo "Habilitando e iniciando o serviço do Zabbix Agent"
  - systemctl enable zabbix-agent  
  - systemctl start zabbix-agent   


  # Cria log e verifica instalação
  
  - echo "Instalação concluída em $(date +"%Y-%m-%d %H:%M:%S")" >> /var/log/zabbix_agent_install.log
  - echo "Verificando status do serviço"
  - systemctl status zabbix-agent
  - zabbix_agentd -V 
