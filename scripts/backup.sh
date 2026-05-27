#!/bin/bash

FECHA=$(date '+%Y-%m-%d_%H-%M-%S')
BACKUP_DIR="/opt/backups"
ORIGEN="/opt/monitoring"

mkdir -p $BACKUP_DIR

tar -czf $BACKUP_DIR/monitoring_backup_$FECHA.tar.gz $ORIGEN

echo "[$FECHA] Backup creado: $BACKUP_DIR/monitoring_backup_$FECHA.tar.gz" >> /var/log/backup.log
echo "Backup completado exitosamente: monitoring_backup_$FECHA.tar.gz"
