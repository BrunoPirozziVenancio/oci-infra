output "vcn_id" {
  description = "OCID da VCN"
  value       = oci_core_vcn.main.id
}
output "subnet_id" {
  description = "OCID da subnet publica"
  value       = oci_core_subnet.public.id
}
output "internet_gateway_id" {
  description = "OCID do Internet Gateway"
  value       = oci_core_internet_gateway.main.id
}
output "security_list_id" {
  description = "OCID da Security List"
  value       = oci_core_security_list.public.id
}
