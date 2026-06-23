resource "oci_core_vcn" "main" {
  compartment_id = var.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "${var.project_name}-vcn"
  dns_label      = "monitoringvcn"
}
resource "oci_core_internet_gateway" "main" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.project_name}-igw"
  enabled        = true
}
resource "oci_core_route_table" "main" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.project_name}-rt"
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.main.id
  }
}
resource "oci_core_security_list" "servers" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.project_name}-sl-servers"
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options { min = 22 max = 22 }
  }
  ingress_security_rules {
    protocol = "6"
    source   = "10.0.0.0/16"
    tcp_options { min = 9100 max = 9100 }
  }
}
resource "oci_core_security_list" "monitoring" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.project_name}-sl-monitoring"
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options { min = 22 max = 22 }
  }
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options { min = 3000 max = 3000 }
  }
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options { min = 9090 max = 9090 }
  }
}
resource "oci_core_subnet" "servers" {
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.main.id
  cidr_block        = "10.0.1.0/24"
  display_name      = "${var.project_name}-subnet-servers"
  dns_label         = "servers"
  route_table_id    = oci_core_route_table.main.id
  security_list_ids = [oci_core_security_list.servers.id]
}
resource "oci_core_subnet" "monitoring" {
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.main.id
  cidr_block        = "10.0.2.0/24"
  display_name      = "${var.project_name}-subnet-monitoring"
  dns_label         = "monitoring"
  route_table_id    = oci_core_route_table.main.id
  security_list_ids = [oci_core_security_list.monitoring.id]
}
resource "oci_core_instance" "database" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  shape               = "VM.Standard.A1.Flex"
  display_name        = "${var.project_name}-database"
  shape_config { ocpus = 1 memory_in_gbs = 6 }
  source_details { source_type = "image" source_id = var.image_id }
  create_vnic_details {
    subnet_id        = oci_core_subnet.servers.id
    assign_public_ip = true
    display_name     = "${var.project_name}-database-vnic"
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
  freeform_tags = { Role = "database" Environment = var.environment }
}
resource "oci_core_instance" "proxy" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  shape               = "VM.Standard.A1.Flex"
  display_name        = "${var.project_name}-proxy"
  shape_config { ocpus = 1 memory_in_gbs = 6 }
  source_details { source_type = "image" source_id = var.image_id }
  create_vnic_details {
    subnet_id        = oci_core_subnet.servers.id
    assign_public_ip = true
    display_name     = "${var.project_name}-proxy-vnic"
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
  freeform_tags = { Role = "proxy" Environment = var.environment }
}
resource "oci_core_instance" "backend" {
  count               = 3
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  shape               = "VM.Standard.A1.Flex"
  display_name        = "${var.project_name}-backend-${count.index + 1}"
  shape_config { ocpus = 1 memory_in_gbs = 6 }
  source_details { source_type = "image" source_id = var.image_id }
  create_vnic_details {
    subnet_id        = oci_core_subnet.servers.id
    assign_public_ip = true
    display_name     = "${var.project_name}-backend-${count.index + 1}-vnic"
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
  freeform_tags = { Role = "backend" Environment = var.environment }
}
resource "oci_core_instance" "monitoring" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  shape               = "VM.Standard.A1.Flex"
  display_name        = "${var.project_name}-monitoring"
  shape_config { ocpus = 2 memory_in_gbs = 12 }
  source_details { source_type = "image" source_id = var.image_id }
  create_vnic_details {
    subnet_id        = oci_core_subnet.monitoring.id
    assign_public_ip = true
    display_name     = "${var.project_name}-monitoring-vnic"
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
  freeform_tags = { Role = "monitoring" Environment = var.environment }
}
