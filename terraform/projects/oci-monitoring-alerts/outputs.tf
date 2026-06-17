output "notification_topic_id" {
  description = "OCID do topico de notificacao"
  value       = oci_ons_notification_topic.main.id
}
output "cpu_alarm_id" {
  description = "OCID do alarme de CPU"
  value       = oci_monitoring_alarm.cpu_high.id
}
output "memory_alarm_id" {
  description = "OCID do alarme de memoria"
  value       = oci_monitoring_alarm.memory_high.id
}
output "subscription_id" {
  description = "OCID da subscription de email"
  value       = oci_ons_subscription.email.id
}
