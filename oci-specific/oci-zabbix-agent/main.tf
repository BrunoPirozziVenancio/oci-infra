# Configuração do provedor OCI

provider "oci" {
  tenancy_ocid = var.tenancy_ocid                           # OCID do seu tenancy OCI
  user_ocid = var.user_ocid                              # OCID do usuário API
  fingerprint = var.fingerprint                            # Fingerprint da chave API
  private_key_path = var.private_key_path                       # Caminho para a chave privada API
  region = var.region                                     # Região OCI 


# Recurso para criar instância do Zabbix Agent

resource "oci_core_instance" "zabbix_agent_instance" {
  availability_domain = var.availability_domain              # Domínio de disponibilidade (alta disponibilidade)
  
  compartment_id = var.compartment_id                  # Compartimento OCI onde será criado
  
  shape = var.shape
 
  display_name = "Zabbix-Agent-Instance"          # No console OCI


  # Configuração de rede (VNIC)
  
  create_vnic_details {
    subnet_id = var.subnet_id  # Sub-rede para conectar a instância
  }


  # Fonte da imagem da instância
  
  source_details {
    source_type = "image"                  # Tipo de origem (imagem)
    source_id   = var.image_id                  # OCID da imagem
  }

  
  # Metadados da instância
  
  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)            # Chave SSH para acesso
    
    user_data           = base64encode(file("userdata.sh"))            # Script de inicialização (userdata) codificado em base64
  }
}
