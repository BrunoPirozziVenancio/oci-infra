# Define um output que será exibido após o 'terraform apply'

output "instance_public_ip" {
  description = "Public IP of the Zabbix Agent instance"          # Descrição do que este output representa
  value       = oci_core_instance.zabbix_agent_instance.public_ip        # Obtém o IP público da instância criada
}
