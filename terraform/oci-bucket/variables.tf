# Dados da conta - vai tudo no terraform.tfvars

    variable "tenancy_ocid"       {}
    variable "user_ocid"          {}
    variable "fingerprint"        {}
    variable "private_key_path"   {}

# A região padrão costuma ser SP

    variable "region" {
      default = "sa-saopaulo-1"
    }

# Compartimento onde o bucket vai ser criado

    variable "compartment_ocid"   {}

# Nome do bucket que vai aparecer na OCI
  
    variable "bucket_name" {
      default     = "meu-bucket"
      description = "Nome do bucket no Object Storage"
    }

# Controle de acesso - padrão é privado
  
    variable "access_type" {
      default     = "NoPublicAccess"
      description = "Tipo de acesso: NoPublicAccess, ObjectRead, ObjectReadWithoutList"
    }
