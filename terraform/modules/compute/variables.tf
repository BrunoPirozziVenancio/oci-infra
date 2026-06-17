variable "compartment_id" {
  description = "OCID do compartimento"
  type        = string
}
variable "instance_name" {
  description = "Nome da instancia"
  type        = string
}
variable "availability_domain" {
  description = "Availability Domain"
  type        = string
}
variable "shape" {
  description = "Shape da instancia"
  type        = string
  default     = "VM.Standard.A1.Flex"
}
variable "ocpus" {
  description = "Numero de OCPUs"
  type        = number
  default     = 1
}
variable "memory_in_gbs" {
  description = "Memoria em GB"
  type        = number
  default     = 6
}
variable "image_id" {
  description = "OCID da imagem"
  type        = string
}
variable "subnet_id" {
  description = "OCID da subnet"
  type        = string
}
variable "assign_public_ip" {
  description = "Atribuir IP publico"
  type        = bool
  default     = true
}
variable "ssh_public_key" {
  description = "Chave SSH publica"
  type        = string
}
variable "user_data" {
  description = "Script de inicializacao"
  type        = string
  default     = ""
}
variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "dev"
}
