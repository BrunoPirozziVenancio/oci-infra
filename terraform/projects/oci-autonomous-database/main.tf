module "vcn" {
  source             = "../../modules/vcn"
  compartment_id     = var.compartment_id
  vcn_name           = "${var.project_name}-vcn"
  cidr_block         = "10.0.0.0/16"
  dns_label          = "adbvcn"
  public_subnet_cidr = "10.0.1.0/24"
  environment        = var.environment
}
module "compute" {
  source              = "../../modules/compute"
  compartment_id      = var.compartment_id
  instance_name       = "${var.project_name}-server"
  availability_domain = var.availability_domain
  image_id            = var.image_id
  subnet_id           = module.vcn.subnet_id
  ssh_public_key      = var.ssh_public_key
  environment         = var.environment
  user_data           = base64encode("#!/bin/bash\nyum install -y oracle-instantclient-basic oracle-instantclient-sqlplus")
}
resource "oci_database_autonomous_database" "main" {
  compartment_id           = var.compartment_id
  display_name             = "${var.project_name}-adb"
  db_name                  = var.db_name
  admin_password           = var.db_admin_password
  cpu_core_count           = 1
  data_storage_size_in_tbs = 1
  db_workload              = "OLTP"
  is_free_tier             = true
  freeform_tags = {
    Environment = var.environment
  }
}
