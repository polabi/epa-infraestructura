# Configuración de Firewall - SRV-MON-01 (Servidor de Monitoreo)

## Herramienta utilizada
UFW (Uncomplicated Firewall) sobre Ubuntu Server 22.04

## Estado
Activo (`Status: active`)

## Reglas configuradas

| Puerto | Protocolo | Acción | Descripción |
|--------|-----------|--------|-------------|
| 22 | TCP | ALLOW | Acceso SSH remoto |
| 9090 | TCP | ALLOW | Prometheus (interfaz web y API) |
| 3000 | TCP | ALLOW | Grafana (dashboard de monitoreo) |
| 9100 | TCP | ALLOW | Node Exporter (métricas del sistema) |

## Comandos ejecutados

```bash
sudo ufw enable
sudo ufw allow 22/tcp
sudo ufw allow 9090/tcp
sudo ufw allow 3000/tcp
sudo ufw allow 9100/tcp
sudo ufw status
```

## Justificación técnica

- **Puerto 22 (SSH):** Permite administración remota segura del servidor. Se habilitó primero para evitar perder acceso al activar el firewall.
- **Puerto 9090 (Prometheus):** Necesario para que los demás servidores puedan ser consultados y para acceder a la interfaz web de Prometheus.
- **Puerto 3000 (Grafana):** Expone el dashboard de monitoreo accesible desde la red interna del proyecto.
- **Puerto 9100 (Node Exporter):** Permite que Prometheus recolecte las métricas de hardware y sistema operativo de SRV-MON-01.

## Política por defecto
Todos los puertos no listados permanecen bloqueados por defecto (`default deny`).
