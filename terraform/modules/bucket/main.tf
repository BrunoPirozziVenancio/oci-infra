resource "oci_objectstorage_bucket" "main" {
  compartment_id = var.compartment_id
  namespace      = var.namespace
  name           = var.bucket_name
  access_type    = var.access_type
  versioning     = var.versioning ? "Enabled" : "Disabled"
  freeform_tags = {
    Environment = var.environment
    Name        = var.bucket_name
  }
}
