output "load_balancer_ip" {
  description = "IP publico do Load Balancer"
  value       = oci_load_balancer_load_balancer.main.ip_address_details[0].ip_address
}
output "load_balancer_url" {
  description = "URL do Load Balancer"
  value       = "http://${oci_load_balancer_load_balancer.main.ip_address_details[0].ip_address}"
}
output "server1_ip" {
  description = "IP privado do servidor 1"
  value       = module.compute_1.private_ip
}
output "server2_ip" {
  description = "IP privado do servidor 2"
  value       = module.compute_2.private_ip
}
