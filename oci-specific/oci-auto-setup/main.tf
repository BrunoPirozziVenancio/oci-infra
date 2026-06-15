# Configuração do provedor OCI (Oracle Cloud Infrastructure)


      # O bloco 'provider' define qual provedor de nuvem será utilizado e suas configurações
provider "oci" {
  region = var.region      # A região OCI onde os recursos serão criados, definida por uma variável
}


# Criação de uma instância de computação (VM) na OCI

resource "oci_core_instance" "devops_instance" {
  availability_domain = var.availability_domain          # Domínio de disponibilidade onde a instância será provisionada, isso garante resiliência dentro de uma região OCI
  
  compartment_id = var.compartment_id                  # ID do compartimento OCI onde o recurso será criado compartimentos são como pastas que organizam recursos na OCI
  
  shape = var.shape                # Formato (shape) da instância que define CPU, memória e outros recursos


  # Configuração da interface de rede virtual (VNIC) da instância

  create_vnic_details {
    subnet_id = var.subnet_id          # ID da sub-rede onde a VNIC será criada
    assign_public_ip = true                    # Atribui um IP público à instância
    display_name = "public-vnic"          # Nome exibido para a VNIC
    hostname_label = "devops-instance"            # Rótulo do hostname para DNS
  }


  # Configuração da origem da instância (imagem base)

  source_details {
    source_type = "image"          # Tipo de origem (imagem, volume, etc.)
    source_id = var.image_ocid          #  ID da imagem OCI a ser usada (OCID)
  }


  # Metadados da instância

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)        # Chaves SSH públicas para autenticação na instância
    

    user_data           = base64encode(file("${path.module}/cloud-init.yaml"))                    # Dados de usuário (cloud-init) para configuração inicial
                                                                                                  # O arquivo cloud-init.yaml é codificado em base64 antes de ser enviado
  }


  display_name = "oci-auto-setup-instance"           # Nome de exibição da instância no console OCI
}
