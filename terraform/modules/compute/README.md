# Modulo: Compute

Modulo Terraform reutilizavel para criacao de instancias na OCI.

## Recursos criados

- Instancia OCI com shape flexivel
- VNIC com IP publico opcional

## Inputs

- compartment_id: OCID do compartimento
- instance_name: Nome da instancia
- availability_domain: Availability Domain
- shape: Shape da instancia (default: VM.Standard.A1.Flex)
- ocpus: Numero de OCPUs (default: 1)
- memory_in_gbs: Memoria em GB (default: 6)
- image_id: OCID da imagem
- subnet_id: OCID da subnet
- assign_public_ip: Atribuir IP publico (default: true)
- ssh_public_key: Chave SSH publica
- user_data: Script de inicializacao
- environment: Ambiente (default: dev)

## Outputs

- instance_id: OCID da instancia
- public_ip: IP publico
- private_ip: IP privado
