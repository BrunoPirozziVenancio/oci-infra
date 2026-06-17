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
  default     = "website-cdn"
}
variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "dev"
}
variable "par_expiry_date" {
  description = "Data de expiracao do Pre-Authenticated Request (formato RFC3339)"
  type        = string
  default     = "2026-12-31T23:59:59Z"
}
