# EPA - Infraestructura TI

Proyecto Final — Administración de Infraestructura TI  
**Universidad del Quindío | 2026**

## Descripción

Diseño e implementación de la infraestructura TI de las **Empresas Públicas de Armenia E.S.P. (EPA)**, incluyendo servidores, servicios, seguridad, monitoreo y automatización.

## Equipo

| Integrante | GitHub | Rol |
|---|---|---|
| Santiago Polanía | @polabi | Coordinación, Git, Packet Tracer |
| Juan Pablo Mejía | @jpelefantino | SRV-WEB-01 — Nginx |
| Jefferson Rodríguez | @JeffersonRodriguezV | SRV-DB-01 — PostgreSQL + RAID |
| Santiago Ramírez | @sramirezsicarony | SRV-MGT-01 — SSH + NTP + Samba |
| Juan Pablo Rodríguez | — | SRV-MON-01 — Monitoreo |

## Arquitectura

| Servidor | VLAN | IP | Servicio |
|---|---|---|---|
| SRV-WEB-01 | VLAN 10 — DMZ | 192.168.1.10 | Nginx |
| SRV-DB-01 | VLAN 40 — DB | — | PostgreSQL |
| SRV-MGT-01 | VLAN 20 — Gestión | — | SSH + NTP + Samba |
| SRV-MON-01 | VLAN 40 — Monitoreo | — | Prometheus + Grafana |

## Tecnologías

- Ubuntu Server 22.04 LTS
- Docker y Docker Compose
- Nginx, PostgreSQL, Samba, NTP
- RAID 1 + LVM
- UFW Firewall
- SSH con llaves RSA 4096
- Prometheus + Grafana

## Infraestructura de Red

La topología de red fue diseñada en Cisco Packet Tracer utilizando:
- VLANs
- Router-on-a-Stick
- ACLs
- Segmentación de servicios
- Monitoreo y administración

El archivo .pkt y el diagrama exportado se encuentran en:
- /packettracer
- /docs
- Bash Scripts

