# IT Projects — Matt

Hands-on infrastructure and software projects I've designed, built and run myself. Each one is in real, daily use.

By day I'm the Service Innovation & Analytics Lead in a luxury automotive service department. These projects are where I build the tools and systems behind that work, and where I practice Linux, networking, security and full-stack development.

## Projects

| Project | What it is | Stack | Status |
|---|---|---|---|
| [**Pitlane**](projects/pitlane/README.md) | Desktop app that tracks every repair-order recommendation and each service advisor's close rate. Replaced a manual Excel process and is used daily by a dealership service team. | Python · Flask · PyWebView · SQLite · JavaScript | In production · v1.9 |
| [**Homelab Server**](projects/homelab-server/README.md) | Two-node home server: network-wide DNS filtering and DHCP, a self-hosted media platform behind a VPN kill switch, zero-trust remote access, and automated patching with rollback. | Ubuntu Server · Docker · Pi-hole · NetBird · Bash | Active · Phase 2 of 4 |

## Skills across projects

| Area | Where it shows up |
|---|---|
| **Linux administration** | Ubuntu Server, systemd services and timers, netplan, sudoers, journald (Homelab) |
| **Networking** | DHCP/DNS design, static addressing, routing, IPv6 leak closure, WireGuard mesh VPN (Homelab) |
| **Security** | Key-only SSH, least-privilege sudo, UFW, fail2ban, SSO reverse proxy, bcrypt auth (Homelab, Pitlane) |
| **Containers** | Docker, Compose, 12+ services, VPN-routed containers, health checks and rollback (Homelab) |
| **Software development** | Python/Flask backend, vanilla JS single-page app, SQLite, PDF/CSV reporting (Pitlane) |
| **Automation** | Bash and PowerShell tooling, scheduled jobs, idempotent setup scripts (Homelab) |
| **Testing & release** | Regression tests against production data copies, versioned update packs that never touch user data (Pitlane) |
| **Data analysis** | Close-rate analysis that changed a department's follow-up process (Pitlane) |

## How these are documented

Each project has a one-page **README** (problem, solution, architecture, highlights) and a short **CHANGELOG** of milestones. Logs are updated as the projects grow. See [MAINTAINING.md](MAINTAINING.md) for the format.
