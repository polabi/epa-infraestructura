#!/bin/bash

LOG_FILE="/var/log/monitor.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "===== REPORTE DE MONITOREO - $DATE =====" >> $LOG_FILE

# CPU
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
echo "CPU en uso: $CPU%" >> $LOG_FILE

# RAM
RAM=$(free -m | awk 'NR==2{printf "Usado: %sMB / Total: %sMB (%.2f%%)", $3,$2,$3*100/$2}')
echo "RAM - $RAM" >> $LOG_FILE

# Disco
DISCO=$(df -h / | awk 'NR==2{printf "Usado: %s / Total: %s (%s)", $3,$2,$5}')
echo "Disco - $DISCO" >> $LOG_FILE

# Contenedores Docker
echo "--- Contenedores Docker ---" >> $LOG_FILE
docker ps --format "{{.Names}}: {{.Status}}" >> $LOG_FILE

echo "======================================" >> $LOG_FILE
echo "" >> $LOG_FILE
