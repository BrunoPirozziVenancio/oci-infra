module "vcn" {
  source             = "../../modules/vcn"
  compartment_id     = var.compartment_id
  vcn_name           = "${var.project_name}-vcn"
  cidr_block         = "10.0.0.0/16"
  dns_label          = "websitevcn"
  public_subnet_cidr = "10.0.1.0/24"
  environment        = var.environment
}
module "compute" {
  source              = "../../modules/compute"
  compartment_id      = var.compartment_id
  instance_name       = "${var.project_name}-server"
  availability_domain = var.availability_domain
  shape               = "VM.Standard.A1.Flex"
  ocpus               = 1
  memory_in_gbs       = 6
  image_id            = var.image_id
  subnet_id           = module.vcn.subnet_id
  ssh_public_key      = var.ssh_public_key
  assign_public_ip    = true
  environment         = var.environment
  user_data           = base64encode(<<-SCRIPT
    #!/bin/bash
    yum update -y
    yum install -y nginx
    systemctl start nginx
    systemctl enable nginx
    echo "<h1>Website na OCI!</h1><p>Provisionado com Terraform.</p>" > /usr/share/nginx/html/index.html
  SCRIPT
  )
}
module "bucket" {
  source         = "../../modules/bucket"
  compartment_id = var.compartment_id
  namespace      = var.namespace
  bucket_name    = "${var.project_name}-bucket"
  versioning     = true
  environment    = var.environment
}
