# Usuarios y Grupos — SRV-MGT-01

## Grupos creados

| Grupo | GID | Descripción |
|-------|-----|-------------|
| epa_admins | 1002 | Administradores del sistema |
| epa_users | 1003 | Usuarios generales |
| epa_iso | 1004 | Usuarios con acceso a documentos ISO 9001 |

## Comandos ejecutados

sudo groupadd epa_admins
sudo groupadd epa_users
sudo groupadd epa_iso
sudo usermod -aG epa_admins Ubuntu

## Permisos especiales

| Directorio | Permiso | Tipo | Descripción |
|------------|---------|------|-------------|
| /compartido/iso9001 | drwxr-sr-x | SETGID | Archivos heredan grupo epa_iso |
| /compartido/tmp | drwxr-xr-t | Sticky bit | Solo el dueño puede borrar sus archivos |

## Comandos ejecutados

sudo chmod g+s /compartido/iso9001
sudo chmod +t /compartido/tmp
sudo chown -R root:epa_iso /compartido/iso9001
sudo chown -R root:epa_users /compartido/tmp
