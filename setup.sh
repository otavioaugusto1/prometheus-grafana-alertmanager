#!/bin/bash
# setup.sh - Script para inicializar o ambiente de monitoramento simplificado

# Criar estrutura de diretórios
mkdir -p prometheus grafana/provisioning/datasources

# Verificar se o Docker e o Docker Compose estão instalados
if ! [ -x "$(command -v docker)" ]; then
  echo 'Erro: Docker não está instalado.' >&2
  exit 1
fi

if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Erro: Docker Compose não está instalado.' >&2
  exit 1
fi

# Iniciar os serviços
echo "Iniciando os serviços de monitoramento..."
docker-compose up -d

echo "Verificando se todos os serviços estão funcionando..."
sleep 10
docker-compose ps

echo "Sistema de monitoramento inicializado!"
echo "Acesse o Grafana em: http://localhost:3000 (usuário: admin, senha: admin_password)"
echo "Acesse o Prometheus em: http://localhost:9090"
echo "Acesse o cAdvisor em: http://localhost:8080"
echo "Acesse o Node Exporter em: http://localhost:9100"
