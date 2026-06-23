variable "tenancy_ocid" {
  description = "OCID do tenancy"
  type        = string
}
variable "user_ocid" {
  description = "OCID do usuario"
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
variable "availability_domain" {
  description = "Availability Domain"
  type        = string
}
variable "image_id" {
  description = "OCID da imagem Oracle Linux"
  type        = string
}
variable "ssh_public_key" {
  description = "Chave SSH publica"
  type        = string
}
variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "oci-grafana-monitoring"
}
variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "dev"
}
