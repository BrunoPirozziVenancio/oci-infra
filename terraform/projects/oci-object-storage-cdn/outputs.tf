output "bucket_name" {
  description = "Nome do bucket"
  value       = oci_objectstorage_bucket.website.name
}
output "par_url" {
  description = "URL publica do site via Pre-Authenticated Request"
  value       = "https://objectstorage.${var.namespace}.oraclecloud.com${oci_objectstorage_preauthrequest.website.access_uri}"
}
output "object_url" {
  description = "URL direta do index.html"
  value       = "https://objectstorage.sa-saopaulo-1.oraclecloud.com/n/${var.namespace}/b/${var.bucket_name}/o/index.html"
}
