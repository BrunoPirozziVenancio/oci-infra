output "website_public_ip" {
  description = "IP publico do servidor web"
  value       = module.compute.public_ip
}
output "website_url" {
  description = "URL do website"
  value       = "http://${module.compute.public_ip}"
}
output "bucket_name" {
  description = "Nome do bucket criado"
  value       = module.bucket.bucket_name
}
output "vcn_id" {
  description = "OCID da VCN"
  value       = module.vcn.vcn_id
}
