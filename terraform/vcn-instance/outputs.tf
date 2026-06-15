# Isso retorna o IP público da instância criada

output "public_ip" {
  value = oci_core_instance.vm.public_ip
}
