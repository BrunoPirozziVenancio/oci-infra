resource "oci_objectstorage_bucket" "website" {
  compartment_id = var.compartment_id
  namespace      = var.namespace
  name           = var.bucket_name
  access_type    = "ObjectRead"
  versioning     = "Enabled"
  freeform_tags = {
    Environment = var.environment
    Purpose     = "CDN-Website"
  }
}
resource "oci_objectstorage_object" "index" {
  bucket    = oci_objectstorage_bucket.website.name
  namespace = var.namespace
  object    = "index.html"
  content_type = "text/html"
  content   = <<-HTML
    <!DOCTYPE html>
    <html lang="pt-br">
    <head>
      <meta charset="UTF-8">
      <title>Site no OCI Object Storage</title>
    </head>
    <body>
      <h1>Site servido pelo OCI Object Storage!</h1>
      <p>Conteudo estatico entregue via CDN da Oracle.</p>
    </body>
    </html>
  HTML
}
resource "oci_objectstorage_preauthrequest" "website" {
  namespace    = var.namespace
  bucket       = oci_objectstorage_bucket.website.name
  name         = "${var.bucket_name}-par"
  access_type  = "AnyObjectRead"
  time_expires = var.par_expiry_date
}
