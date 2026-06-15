# OCID do compartimento onde todos os recursos serão criados

variable "compartment_ocid" {
  type          = string
  description   = "OCID do compartimento"
}

# Domínio de disponibilidade (ex: Uocm:SA-SAOPAULO-1-AD-1)

variable "availability_domain" {
  type          = string
  description   = "Domínio de disponibilidade"
}

# Tipo da VM. O padrão aqui é uma micro VM

variable "shape" {
  type          = string
  default       = "VM.Standard.E2.1.Micro"
}

# Chave pública SSH para acessar as instâncias

variable "ssh_public_key" {
  type          = string
  description   = "Chave pública SSH"
}

# Subnet onde as instâncias serão criadas

variable "subnet_ocid" {
  type          = string
  description   = "OCID da subnet para as VMs"
}

# Subnet onde o Load Balancer será provisionado

variable "lb_subnet_ocid" {
  type          = string
  description   = "OCID da subnet para o Load Balancer"
}
