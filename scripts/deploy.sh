#!/bin/bash

DATE=$(date '+%Y-%m-%d %H:%M:%S')
MONITORING_DIR="/opt/monitoring"

echo "[$DATE] Iniciando despliegue del stack de monitoreo..."

cd $MONITORING_DIR

# Detener contenedores si están corriendo
echo "Deteniendo contenedores existentes..."
docker compose down

# Levantar stack
echo "Levantando stack de monitoreo..."
docker compose up -d

# Verificar estado
echo "Verificando estado de contenedores..."
sleep 10
docker compose ps

echo "[$DATE] Despliegue completado." >> /var/log/deploy.log
echo "Despliegue finalizado exitosamente."
