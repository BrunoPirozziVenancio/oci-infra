variable "tenancy_ocid" {
  description = "OCID do tenancy OCI"
  type        = string
}
variable "user_ocid" {
  description = "OCID do usuario OCI"
  type        = string
}
variable "fingerprint" {
  description = "Fingerprint da chave API"
  type        = string
}
variable "private_key_path" {
  description = "Caminho da chave privada OCI"
  type        = string
  default     = "~/.oci/oci_api_key.pem"
}
variable "region" {
  description = "Regiao OCI"
  type        = string
  default     = "sa-saopaulo-1"
}
variable "compartment_id" {
  description = "OCID do compartimento"
  type        = string
}
