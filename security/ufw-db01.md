# Firewall UFW — SRV-DB-01

## Configuración aplicada

Política por defecto: denegar todo el tráfico entrante.

## Reglas activas

| Puerto | Protocolo | Servicio | Acción |
|--------|-----------|----------|--------|
| 22     | TCP       | SSH      | ALLOW  |
| 5432   | TCP       | PostgreSQL | ALLOW  |

## Comandos ejecutados

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 5432/tcp
sudo ufw enable
