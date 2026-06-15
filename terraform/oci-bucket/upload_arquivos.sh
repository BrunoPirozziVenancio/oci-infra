#!/bin/bash

# Substitua com seus dados ou use variáveis de ambiente

BUCKET_NAME="bruno-backups"
NAMESPACE="meu_namespace"
REGIAO="sa-saopaulo-1"

# Upload dos arquivos simulando tipos diferentes

oci os object put --bucket-name $BUCKET_NAME --name "backups/backup_17072025.tar.gz" --file exemplos_upload/backup_17072025.tar.gz --namespace $NAMESPACE --region $REGIAO

oci os object put --bucket-name $BUCKET_NAME --name "logs/access.log" --file exemplos_upload/access.log --namespace $NAMESPACE --region $REGIAO

oci os object put --bucket-name $BUCKET_NAME --name "configs/nginx.conf" --file exemplos_upload/nginx.conf --namespace $NAMESPACE --region $REGIAO
