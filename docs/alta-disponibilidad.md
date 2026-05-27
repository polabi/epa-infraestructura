# Alta Disponibilidad — EPA Infraestructura TI

## 1. Introducción

La alta disponibilidad (HA) garantiza que los servicios críticos de EPA permanezcan
operativos ante fallos de hardware o software. Este documento describe la estrategia
conceptual y práctica implementada en el proyecto.

## 2. Componentes implementados

### 2.1 RAID 1 — Redundancia de disco
Implementado en SRV-DB-01 por Jefferson Rodríguez.

El arreglo RAID 1 usa dos discos (/dev/sde y /dev/sdf) en espejo. Si uno falla,
el sistema continúa operando con el disco restante sin pérdida de datos.

- Tecnología: mdadm
- Nivel: RAID 1 (espejo)
- Discos: /dev/sde + /dev/sdf (10 GB cada uno)
- Estado verificado: clean, 2 dispositivos activos

### 2.2 LVM — Gestión flexible de volúmenes
Implementado sobre el RAID 1, permite redimensionar volúmenes sin detener servicios.

- vg_epa: grupo de volúmenes principal
- lv_postgres: 5 GB para datos de PostgreSQL
- lv_backups: 3 GB para respaldos

### 2.3 Docker restart policy
Todos los contenedores tienen configurado restart: unless-stopped, lo que garantiza
que se reinician automáticamente si el proceso falla o si la VM se reinicia.

### 2.4 Scripts de backup y deploy
- backup.sh: genera respaldos automáticos con crontab
- deploy.sh: permite reconstruir toda la infraestructura con un solo comando
- El repositorio Git actúa como fuente de verdad para reconstruir el ambiente

## 3. Estrategia conceptual de balanceo de carga

En un entorno de producción real, EPA implementaría las siguientes mejoras:

### 3.1 Balanceo de carga para el servidor web
Dos instancias del contenedor Nginx detrás de un balanceador HAProxy o Nginx
como proxy inverso. Si una instancia falla, el balanceador redirige el tráfico
a la instancia disponible automáticamente.

Arquitectura propuesta:

Internet → HAProxy (puerto 80) → Nginx-1 (contenedor 1)
                               → Nginx-2 (contenedor 2)

### 3.2 Replicación de base de datos
PostgreSQL en modo primario-secundario (streaming replication). El nodo secundario
recibe cambios en tiempo real del primario. Si el primario falla, el secundario
asume el rol automáticamente (failover).

Arquitectura propuesta:

Aplicación → PostgreSQL Primario → PostgreSQL Secundario (réplica)
                                  (failover automático)

### 3.3 Monitoreo y alertas
Prometheus con alertas configuradas notifica al equipo cuando un servicio cae,
permitiendo intervención antes de que el usuario final lo note.

## 4. Recuperación ante fallos

| Escenario | Impacto | Solución implementada |
|-----------|---------|----------------------|
| Disco falla en SRV-DB-01 | Ninguno | RAID 1 mantiene operación |
| Contenedor se detiene | Segundos | restart: unless-stopped |
| VM se reinicia | Minutos | Docker inicia contenedores automáticamente |
| Pérdida de datos | Recuperable | backup.sh + crontab diario |
| Fallo total del servidor | Reconstruible | deploy.sh + repositorio Git |

## 5. Comandos de verificación

Verificar estado del RAID:
sudo mdadm --detail /dev/md1

Verificar contenedores activos:
docker ps

Ejecutar backup manual:
bash scripts/backup.sh

Reconstruir infraestructura completa:
bash scripts/deploy.sh

## 6. Conclusión

Aunque el entorno académico tiene limitaciones de hardware, la infraestructura
implementada cubre los principios fundamentales de alta disponibilidad mediante
RAID 1, políticas de reinicio automático de contenedores, backups automatizados
y documentación que permite reconstruir el ambiente desde cero en minutos.
