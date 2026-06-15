# Isso aqui é só um output legal pra debug ou automações futuras

output "instance_id" {
  description = "OCID da instância criada"
  value       = oci_core_instance.cloudinit_instance.id
}

# Esse é o output que mais importa no final: o IP público da instância.
# Depois que rodar o terraform apply, ele vai mostrar esse IP no terminal pra você poder acessar o Nginx no navegador.

output "public_ip" {
  description = "IP público da instância"
  value       = oci_core_instance.cloudinit_instance.public_ip
}
