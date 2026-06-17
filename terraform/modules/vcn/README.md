# Modulo: VCN

Modulo Terraform reutilizavel para criacao de VCN na OCI com subnet publica e Internet Gateway.

## Recursos criados

- VCN
- Internet Gateway
- Route Table publica
- Security List com SSH e HTTP liberados
- Subnet publica

## Inputs

- compartment_id: OCID do compartimento
- vcn_name: Nome da VCN
- cidr_block: CIDR da VCN (default: 10.0.0.0/16)
- dns_label: DNS label da VCN (default: vcnmain)
- public_subnet_cidr: CIDR da subnet publica (default: 10.0.1.0/24)
- environment: Ambiente (default: dev)

## Outputs

- vcn_id: OCID da VCN
- subnet_id: OCID da subnet publica
- internet_gateway_id: OCID do Internet Gateway
- security_list_id: OCID da Security List
