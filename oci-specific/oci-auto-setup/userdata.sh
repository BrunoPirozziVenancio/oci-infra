#cloud-config


package_update: true        # Atualiza a lista de pacotes no primeiro boot

package_upgrade: true        # Atualiza todos os pacotes instalados para as versões mais recentes


# Lista de pacotes para instalação automática:

packages:
  - nginx                   # Servidor web de alto desempenho
  - mysql-server                  # Servidor de banco de dados MySQL


# Comandos executados após a instalação dos pacotes:

runcmd:
  # Instalação do Java 22
  - echo "Instalando Java 22"  
  - wget https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.deb -O /tmp/jdk22.deb
  - dpkg -i /tmp/jdk22.deb || apt --fix-broken install -y                    # Instala o pacote, corrigindo automaticamente dependências se necessário
  - update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-22/bin/java 1
  - java -version                # Verifica a instalação do Java
  

  # Configuração do MySQL
  - echo "Habilitando e iniciando o MySQL"
  - systemctl enable mysql
  - systemctl start mysql


  # Configuração do Nginx
  - echo "Habilitando e iniciando o Nginx"
  - systemctl enable nginx
  - systemctl start nginx


  # Mensagem de conclusão
  - echo "Cloud-Init finalizado"  
