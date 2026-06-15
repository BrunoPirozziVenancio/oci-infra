# Descobre o namespace automaticamente (o namespace é tipo o "ID global" do seu storage)

data "oci_objectstorage_namespace" "ns" {
  compartment_id = var.compartment_ocid
}

# Cria o bucket com versionamento e controle de acesso

resource "oci_objectstorage_bucket" "bucket" {
  name             = var.bucket_name
  compartment_id   = var.compartment_ocid
  namespace        = data.oci_objectstorage_namespace.ns.namespace
  access_type      = var.access_type

  versioning       = "Enabled"   # Útil se quiser guardar histórico dos arquivos
  storage_tier     = "Standard"  # Pode mudar pra "Archive" se for backup frio
}


