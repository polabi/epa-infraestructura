# Configuración SSH — SRV-MGT-01

## Políticas aplicadas

| Parámetro | Valor | Descripción |
|-----------|-------|-------------|
| PermitRootLogin | no | Deshabilita login como root |
| PasswordAuthentication | no | Solo permite llaves RSA |
| MaxAuthTries | 3 | Máximo 3 intentos fallidos |
| X11Forwarding | no | Deshabilita reenvío gráfico |
| AllowGroups | epa_admins | Solo usuarios del grupo epa_admins |

## Llave RSA generada

Tipo: RSA 4096 bits
Ubicación: ~/.ssh/id_rsa
Comentario: epa_admin@srv-mgt-01

## Comando ejecutado

ssh-keygen -t rsa -b 4096 -C "epa_admin@srv-mgt-01"

## Verificación

Conexión SSH exitosa con llave RSA:
ssh localhost -> Welcome to Ubuntu 24.04.4 LTS
