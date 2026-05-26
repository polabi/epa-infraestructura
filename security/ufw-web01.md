# Firewall UFW — SRV-WEB-01

## Configuración aplicada

Política por defecto: denegar todo el tráfico entrante.

## Reglas activas

| Puerto | Protocolo | Servicio | Acción |
|--------|-----------|----------|--------|
| 22     | TCP       | SSH      | ALLOW  |
| 80     | TCP       | HTTP     | ALLOW  |
| 443    | TCP       | HTTPS    | ALLOW  |

## Comandos ejecutados

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
