variable "compartment_id" {
  description = "OCID do compartimento"
  type        = string
}
variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "infra-monitoring"
}
variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "dev"
}
variable "cpu_threshold" {
  description = "Percentual de CPU para disparar alerta CRITICAL"
  type        = number
  default     = 80
}
variable "memory_threshold" {
  description = "Percentual de memoria para disparar alerta WARNING"
  type        = number
  default     = 75
}
variable "notification_email" {
  description = "Email para receber os alertas"
  type        = string
}
