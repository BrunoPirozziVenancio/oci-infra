variable "compartment_ocid" {
  description = "OCID do compartimento OCI"
  type        = string
}

variable "availability_domain" {
  description = "Domínio de disponibilidade da instância"
  type        = string
}

variable "shape" {
  description = "Shape da instância"
  type        = string
  default     = "VM.Standard.E2.1.Micro"
}

variable "ssh_public_key" {
  description = "Chave pública SSH para acesso à instância"
  type        = string
}

variable "subnet_ocid" {
  description = "OCID da subnet onde a instância será criada"
  type        = string
}
