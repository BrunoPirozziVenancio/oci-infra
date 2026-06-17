output "instance_id" {
  description = "OCID da instancia"
  value       = oci_core_instance.main.id
}
output "public_ip" {
  description = "IP publico da instancia"
  value       = oci_core_instance.main.public_ip
}
output "private_ip" {
  description = "IP privado da instancia"
  value       = oci_core_instance.main.private_ip
}
