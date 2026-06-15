# Bloco de output que expõe o endereço IP público da instância criada

output "instance_public_ip" {                  # Este IP permite acesso externo à instância via internet
  description = "Endereço IP público da instância criada" 
  value = oci_core_instance.devops_instance.public_ip            # Referencia o atributo public_ip do recurso instância
}


# Bloco de output que expõe o endereço IP privado da instância criada

output "instance_private_ip" {                # Este IP é usado para comunicação interna dentro da VCN (Rede Virtual Cloud)
  description = "Endereço IP privado da instância criada"             
  value = oci_core_instance.devops_instance.private_ip              # Referencia o atributo private_ip do recurso instância 
}


# Bloco de output que expõe o OCID (Identificador Único) da instância criada

output "instance_id" {              # Este OCID é necessário para gerenciar a instância via API/CLI
  description = "OCID da instância criada"              
  value = oci_core_instance.devops_instance.id                # Referencia o ID único da instância na OCI
}
