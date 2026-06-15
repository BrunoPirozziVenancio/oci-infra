# Caso sua versão seja diferente, mude a "version" para se adequar a susa verão

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

# Provedor da Oracle Cloud - icam aq os dados de acesso

provider "oci" {
  tenancy_ocid      = var.tenancy_ocid
  user_ocid         = var.user_ocid
  fingerprint       = var.fingerprint
  private_key_path  = var.private_key_path
  region            = var.region
}
