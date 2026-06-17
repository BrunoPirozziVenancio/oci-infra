variable "compartment_id" {
  description = "OCID do compartimento"
  type        = string
}
variable "vcn_name" {
  description = "Nome da VCN"
  type        = string
}
variable "cidr_block" {
  description = "CIDR block da VCN"
  type        = string
  default     = "10.0.0.0/16"
}
variable "dns_label" {
  description = "DNS label da VCN"
  type        = string
  default     = "vcnmain"
}
variable "public_subnet_cidr" {
  description = "CIDR da subnet publica"
  type        = string
  default     = "10.0.1.0/24"
}
variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"
}
