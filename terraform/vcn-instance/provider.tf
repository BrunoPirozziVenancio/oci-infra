# Define o provedor OCI e sua versão
# Caso a versão da sua OCI e Terraform forem diferentes das que estão no código, vc deve alterar "version" e "required_version"
# para a que corrsponde para vc

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

# Provedor OCI com autenticação via API Key

provider "oci" {
  tenancy_ocid        = var.tenancy_ocid
  user_ocid           = var.user_ocid
  fingerprint         = var.fingerprint
  private_key_path    = var.private_key_path
  region              = var.region
}
