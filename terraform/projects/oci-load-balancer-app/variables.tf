variable "compartment_id" {
  description = "OCID do compartimento"
  type        = string
}
variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "lb-app"
}
variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "dev"
}
variable "availability_domain" {
  description = "Availability Domain"
  type        = string
}
variable "image_id" {
  description = "OCID da imagem"
  type        = string
}
variable "ssh_public_key" {
  description = "Chave SSH publica"
  type        = string
}
