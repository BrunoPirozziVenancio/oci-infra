resource "oci_core_instance" "main" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  shape               = var.shape
  display_name        = var.instance_name
  shape_config {
    ocpus         = var.ocpus
    memory_in_gbs = var.memory_in_gbs
  }
  source_details {
    source_type = "image"
    source_id   = var.image_id
  }
  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = var.assign_public_ip
    display_name     = "${var.instance_name}-vnic"
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = var.user_data
  }
  freeform_tags = {
    Environment = var.environment
    Name        = var.instance_name
  }
}
