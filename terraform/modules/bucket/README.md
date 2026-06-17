# Modulo: Bucket

Modulo Terraform reutilizavel para criacao de buckets no OCI Object Storage.

## Recursos criados

- Bucket no Object Storage
- Versionamento configuravel
- Controle de acesso publico

## Inputs

- compartment_id: OCID do compartimento
- namespace: Namespace do Object Storage
- bucket_name: Nome do bucket
- access_type: Tipo de acesso (default: NoPublicAccess)
- versioning: Habilitar versionamento (default: true)
- environment: Ambiente (default: dev)

## Outputs

- bucket_name: Nome do bucket
- bucket_namespace: Namespace do bucket
- bucket_id: ID do bucket
