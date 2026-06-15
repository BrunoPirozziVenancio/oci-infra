provider "oci" {
  # Aqui ficaria a configuração do provedor OCI.
  # Se você usa um arquivo config padrão (~/.oci/config), nem precisa colocar mais nada.
  # Caso queira trocar de região ou perfil, pode adicionar: region, tenancy_ocid, user_ocid, etc.
}

# Aqui é feita uma busca da imagem mais recente do Oracle Linux 8, compativél com o shape que vc quer usar
# Assim não é preciso colar um OCID de imagem direto, pq ela pode mudar com o tempo

data "oci_core_images" "oracle_linux" {
  compartment_id = var.compartment_ocid
  operating_system = "Oracle Linux"
  operating_system_version = "8"
  shape = var.shape
  most_recent = true
}

# Aqui o código recebe todos os dados de infra que você passou por variáveis: domínio de disponibilidade, compartimento, shape, e subnet.

resource "oci_core_instance" "cloudinit_instance" {
  availability_domain   = var.availability_domain
  compartment_id        = var.compartment_ocid
  shape                 = var.shape
  subnet_id             = var.subnet_ocid
  display_name          = "instance-cloudinit"

  metadata = {
    ssh_authorized_keys = var.ssh_public_key          #Permite acesso SSH com sua chave pública.

    user_data = base64encode(file("${path.module}/cloud-init/script.yaml"))
  }

  source_details {
    source_type = "image"
    image_id    = data.oci_core_images.oracle_linux.images[0].id
  }
}
