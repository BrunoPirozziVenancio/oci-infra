module "vcn" {
  source             = "../../modules/vcn"
  compartment_id     = var.compartment_id
  vcn_name           = "${var.project_name}-vcn"
  cidr_block         = "10.0.0.0/16"
  dns_label          = "lbappvcn"
  public_subnet_cidr = "10.0.1.0/24"
  environment        = var.environment
}
module "compute_1" {
  source              = "../../modules/compute"
  compartment_id      = var.compartment_id
  instance_name       = "${var.project_name}-server-1"
  availability_domain = var.availability_domain
  image_id            = var.image_id
  subnet_id           = module.vcn.subnet_id
  ssh_public_key      = var.ssh_public_key
  environment         = var.environment
  user_data           = base64encode("#!/bin/bash\nyum install -y nginx\nsystemctl start nginx\necho '<h1>Servidor 1</h1>' > /usr/share/nginx/html/index.html")
}
module "compute_2" {
  source              = "../../modules/compute"
  compartment_id      = var.compartment_id
  instance_name       = "${var.project_name}-server-2"
  availability_domain = var.availability_domain
  image_id            = var.image_id
  subnet_id           = module.vcn.subnet_id
  ssh_public_key      = var.ssh_public_key
  environment         = var.environment
  user_data           = base64encode("#!/bin/bash\nyum install -y nginx\nsystemctl start nginx\necho '<h1>Servidor 2</h1>' > /usr/share/nginx/html/index.html")
}
resource "oci_load_balancer_load_balancer" "main" {
  compartment_id = var.compartment_id
  display_name   = "${var.project_name}-lb"
  shape          = "flexible"
  subnet_ids     = [module.vcn.subnet_id]
  is_private     = false
  shape_details {
    minimum_bandwidth_in_mbps = 10
    maximum_bandwidth_in_mbps = 100
  }
  freeform_tags = {
    Environment = var.environment
  }
}
resource "oci_load_balancer_backend_set" "main" {
  load_balancer_id = oci_load_balancer_load_balancer.main.id
  name             = "${var.project_name}-backend-set"
  policy           = "ROUND_ROBIN"
  health_checker {
    protocol = "HTTP"
    port     = 80
    url_path = "/"
  }
}
resource "oci_load_balancer_backend" "server1" {
  load_balancer_id = oci_load_balancer_load_balancer.main.id
  backendset_name  = oci_load_balancer_backend_set.main.name
  ip_address       = module.compute_1.private_ip
  port             = 80
}
resource "oci_load_balancer_backend" "server2" {
  load_balancer_id = oci_load_balancer_load_balancer.main.id
  backendset_name  = oci_load_balancer_backend_set.main.name
  ip_address       = module.compute_2.private_ip
  port             = 80
}
resource "oci_load_balancer_listener" "main" {
  load_balancer_id         = oci_load_balancer_load_balancer.main.id
  name                     = "${var.project_name}-listener"
  default_backend_set_name = oci_load_balancer_backend_set.main.name
  port                     = 80
  protocol                 = "HTTP"
}
