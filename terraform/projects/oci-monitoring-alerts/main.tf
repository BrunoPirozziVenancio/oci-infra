resource "oci_monitoring_alarm" "cpu_high" {
  compartment_id        = var.compartment_id
  display_name          = "${var.project_name}-cpu-high"
  metric_compartment_id = var.compartment_id
  namespace             = "oci_computeagent"
  query                 = "CpuUtilization[1m].mean() > ${var.cpu_threshold}"
  severity              = "CRITICAL"
  destinations          = [oci_ons_notification_topic.main.id]
  is_enabled            = true
  body                  = "ALERTA: CPU acima de ${var.cpu_threshold}% na instancia monitorada."
  freeform_tags = {
    Environment = var.environment
  }
}
resource "oci_monitoring_alarm" "memory_high" {
  compartment_id        = var.compartment_id
  display_name          = "${var.project_name}-memory-high"
  metric_compartment_id = var.compartment_id
  namespace             = "oci_computeagent"
  query                 = "MemoryUtilization[1m].mean() > ${var.memory_threshold}"
  severity              = "WARNING"
  destinations          = [oci_ons_notification_topic.main.id]
  is_enabled            = true
  body                  = "ALERTA: Memoria acima de ${var.memory_threshold}% na instancia monitorada."
  freeform_tags = {
    Environment = var.environment
  }
}
resource "oci_ons_notification_topic" "main" {
  compartment_id = var.compartment_id
  name           = "${var.project_name}-topic"
  description    = "Topico de notificacoes de alertas de infraestrutura"
  freeform_tags = {
    Environment = var.environment
  }
}
resource "oci_ons_subscription" "email" {
  compartment_id = var.compartment_id
  topic_id       = oci_ons_notification_topic.main.id
  endpoint       = var.notification_email
  protocol       = "EMAIL"
  freeform_tags = {
    Environment = var.environment
  }
}
