# Variável que define a região OCI onde os recursos serão provisionados

variable "region" {
  description = "Região da OCI us-ashburn-1
  type = string      # Tipo de dado esperado 
}


# Variável que especifica o domínio de disponibilidade para a instância, na OCI, cada região tem múltiplos domínios de disponibilidade para alta disponibilidade
variable "availability_domain" {
  description = "Domínio de disponibilidade da instância"          # Fala oq a variável controla
  type = string              # A string será algo com "AD-1" ou "AD-2"
}


# Variável para o OCID (Oracle Cloud Identifier) do compartimento, eles são como "pastas" que organizam recursos na OCI
variable "compartment_id" {
  description = "OCID do compartimento"            # Deve conter o identificador único do compartimento
  type = string           
}


# Variável para o OCID da sub-rede onde a instância será conectada, ela define a rede específica para a conexão da instância
variable "subnet_id" {
  description = "OCID da subnet"            # Identificador único da sub-rede OCI
  type = string         
}


# Variável que fala qual é a imagem do SO que será usado na instância
variable "image_ocid" {
  description = "OCID da imagem do SO 
  type = string
}


# Variável que define o "shape" (tipo/tamanho) da instância de computação, o shape determina CPU, memória e outros recursos da VM
variable "shape" {
  description = "Shape da instância 
  type = string
  default = "VM.Standard.E2.1.Micro"
}


# Variável para armazenar a key pública
variable "ssh_public_key_path" {
  description = "Caminho para o arquivo de chave pública SSH (ex: ~/.ssh/id_rsa.pub)"
  type        = string
}
