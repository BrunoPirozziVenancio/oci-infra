output "adb_connection_string" {
  description = "String de conexao do Autonomous Database"
  value       = oci_database_autonomous_database.main.connection_strings[0].all_connection_strings
}
output "adb_display_name" {
  description = "Nome do Autonomous Database"
  value       = oci_database_autonomous_database.main.display_name
}
output "compute_public_ip" {
  description = "IP publico da instancia"
  value       = module.compute.public_ip
}
output "vcn_id" {
  description = "OCID da VCN"
  value       = module.vcn.vcn_id
}
