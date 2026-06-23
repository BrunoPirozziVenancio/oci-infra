output "monitoring_public_ip" {
  description = "IP publico do servidor de monitoramento"
  value       = oci_core_instance.monitoring.public_ip
}
output "grafana_url" {
  description = "URL do Grafana"
  value       = "http://${oci_core_instance.monitoring.public_ip}:3000"
}
output "prometheus_url" {
  description = "URL do Prometheus"
  value       = "http://${oci_core_instance.monitoring.public_ip}:9090"
}
output "database_private_ip" {
  description = "IP privado do servidor de banco de dados"
  value       = oci_core_instance.database.private_ip
}
output "proxy_public_ip" {
  description = "IP publico do servidor proxy"
  value       = oci_core_instance.proxy.public_ip
}
output "backend_private_ips" {
  description = "IPs privados dos servidores backend"
  value       = oci_core_instance.backend[*].private_ip
}
