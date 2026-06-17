variable "compartment_id" {
  description = "OCID do compartimento"
  type        = string
}
variable "namespace" {
  description = "Namespace do Object Storage"
  type        = string
}
variable "bucket_name" {
  description = "Nome do bucket"
  type        = string
}
variable "access_type" {
  description = "Tipo de acesso (NoPublicAccess, ObjectRead, ObjectReadWithoutList)"
  type        = string
  default     = "NoPublicAccess"
}
variable "versioning" {
  description = "Habilitar versionamento"
  type        = bool
  default     = true
}
variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "dev"
}
