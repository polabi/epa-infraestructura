# Firewall UFW — SRV-MGT-01

## Configuración aplicada

Política por defecto: denegar todo el tráfico entrante.

## Reglas activas

| Puerto | Protocolo | Servicio | Acción |
|--------|-----------|----------|--------|
| 22     | TCP       | SSH      | ALLOW  |
| 123    | UDP       | NTP      | ALLOW  |
| 139    | TCP       | Samba    | ALLOW  |
| 445    | TCP       | Samba    | ALLOW  |

## Comandos ejecutados

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 123/udp
sudo ufw allow 139/tcp
sudo ufw allow 445/tcp
sudo ufw enable
