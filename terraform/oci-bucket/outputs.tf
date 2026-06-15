# Mostra a URL do bucket no final

    output "bucket_url" {
      value = "https://objectstorage.${var.region}.oraclecloud.com/n/${data.oci_objectstorage_namespace.ns.namespace}/b/${oci_objectstorage_bucket.bucket.name}/o/"
    }    
