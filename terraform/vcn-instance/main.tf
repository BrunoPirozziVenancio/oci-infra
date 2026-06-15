# Cria uma VCN com bloco CIDR /16

resource "oci_core_virtual_network" "vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_ocid
  display_name   = "vcn-bruno"
}


# Gateway de Internet 
# Isso é feito para poder fazer a liberação do acesso externo

resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "internet-gateway-bruno"
  is_enabled     = true
}


# Tabela de rota que aponta pra Internet via o IG mencionado acima

resource "oci_core_route_table" "rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "route-table-bruno"

  route_rules {
    destination        = "0.0.0.0/0"
    destination_type   = "CIDR_BLOCK"
    network_entity_id  = oci_core_internet_gateway.ig.id
  }
}


# Subnet pública com IPs liberados

resource "oci_core_subnet" "subnet" {
  cidr_block                    = "10.0.1.0/24"
  compartment_id                = var.compartment_ocid
  vcn_id                        = oci_core_virtual_network.vcn.id
  display_name                  = "subnet-publica-bruno"
  prohibit_public_ip_on_vnic    = false
  route_table_id                = oci_core_route_table.rt.id
}


# Pra saber onde criar a instância, aqui fazemos a busca do domínio de disponibilidade

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}


# Busca a imagem Oracle Linux 8 

data "oci_core_images" "oracle_linux" {
  compartment_id             = var.compartment_ocid
  operating_system           = "Oracle Linux"
  operating_system_version   = "8"
  shape                      = "VM.Standard.E2.1.Micro"
}


# Criação da instância na OCI

resource "oci_core_instance" "vm" {
  availability_domain   = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id        = var.compartment_ocid
  shape                 = "VM.Standard.E2.1.Micro" # Instância gratuita

  create_vnic_details {
    subnet_id          = oci_core_subnet.subnet.id
    assign_public_ip   = true
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }

  source_details {
    source_type   = "image"
    image_id      = data.oci_core_images.oracle_linux.images[0].id
  }

  display_name = "instancia-bruno"
}
