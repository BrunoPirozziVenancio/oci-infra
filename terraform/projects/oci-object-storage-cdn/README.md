# OCI Object Storage como CDN

Bucket de Object Storage configurado para servir conteudo estatico publicamente, funcionando como CDN simples.

## Arquitetura

- Bucket com acesso publico de leitura
- Objeto index.html publicado automaticamente
- Pre-Authenticated Request para URL publica permanente

## Casos de uso

- Hospedar sites estaticos (HTML, CSS, JS)
- Servir imagens e arquivos de midia
- Distribuir arquivos de instalacao
- Backup publico de documentos

## Como usar

### 1. Criar terraform.tfvars
compartment_id  = "ocid1.compartment.oc1..xxx"
namespace       = "seu-namespace"
bucket_name     = "meu-website-cdn"

### 2. Provisionar
terraform init
terraform plan
terraform apply

### 3. Acessar o site
Use a URL gerada no output object_url ou par_url

## Outputs

- bucket_name: Nome do bucket criado
- par_url: URL publica via Pre-Authenticated Request
- object_url: URL direta do index.html

## Destruir

terraform destroy
