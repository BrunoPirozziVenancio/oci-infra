output "bucket_name" {
  description = "Nome do bucket criado"
  value       = oci_objectstorage_bucket.main.name
}
output "bucket_namespace" {
  description = "Namespace do bucket"
  value       = oci_objectstorage_bucket.main.namespace
}
output "bucket_id" {
  description = "ID do bucket"
  value       = oci_objectstorage_bucket.main.id
}
