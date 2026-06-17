# OCI Monitoring + Alertas por Email

Stack completa de monitoramento com alarmes automaticos e notificacoes por email via OCI Monitoring e Notifications.

## Arquitetura

- Alarme de CPU (CRITICAL quando acima de 80%)
- Alarme de Memoria (WARNING quando acima de 75%)
- Topico de Notificacao (ONS)
- Subscription de Email para receber alertas

## Como funciona

O OCI Monitoring coleta metricas das instancias automaticamente.
Quando uma metrica ultrapassa o threshold configurado, o alarme dispara.
O alarme publica uma mensagem no topico ONS.
O topico envia um email para o endereco configurado.

## Como usar

### 1. Criar terraform.tfvars
compartment_id     = "ocid1.compartment.oc1..xxx"
notification_email = "seu-email@gmail.com"
cpu_threshold      = 80
memory_threshold   = 75

### 2. Provisionar
terraform init
terraform plan
terraform apply

### 3. Confirmar email
Apos o apply, confirme o email recebido da Oracle para ativar as notificacoes.

## Outputs

- notification_topic_id: OCID do topico
- cpu_alarm_id: OCID do alarme de CPU
- memory_alarm_id: OCID do alarme de memoria
- subscription_id: OCID da subscription

## Destruir

terraform destroy
