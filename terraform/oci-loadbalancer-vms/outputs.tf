# Mostra o IP público do Load Balancer após a criação

output "load_balancer_public_ip" {
  value = oci_load_balancer_load_balancer.lb.ip_address_details[0].ip_address
  description = "IP público do Load Balancer"
}

# Lista os IPs privados das duas VMs backend (útil pra debug ou logs)

output "web_instances_private_ips" {
  value = [for i in oci_core_instance.web : i.private_ip]
}
