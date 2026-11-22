# Homelab Server — Changelog

Milestones only, newest first.

## November 2026

- **Nov 21:** Fixed new TV series not appearing in Jellyfin (the library watcher had stopped after a restart). Fixed a remote-access outage caused by an expired VPN login on the server, and disabled login expiry for server peers.
- **Nov 18:** Security pass on both nodes: firewall limited to LAN + VPN, key-only SSH, fail2ban, automatic security updates, VPN control API bound to localhost. Added daily config backups to the second node. Rolled out NetBird remote access with an SSO-protected media link.
- **Nov 12–17:** Added the OptiPlex 3000 as a second node, shown in the same dashboard. Blocked smart-TV ad and tracking domains. Rebuilt the Cockpit dashboard with live CPU/RAM/disk and DNS graphs.
- **Nov 10:** Moved DHCP from the ISP gateway to Pi-hole so every device is filtered automatically. Closed an IPv6 DNS bypass. Replaced unchecked auto-updates with a nightly verified update job (health checks, rollback, conditional reboot).
- **Nov 9:** Moved the server to Ethernet with an auto-revert safety timer. Deployed Pi-hole (Quad9 + threat-intel blocklists), a Jellyfin media server, and a VPN gateway container with a kill switch.
- **Nov 8:** Remote management: SSH keys, least-privilege passwordless sudo, firewall and fail2ban baseline. Fixed a wrong default gateway left by the installer.
- **Nov 4–5:** Planned the build and installed Ubuntu Server. Fixed NVMe detection by switching the BIOS storage mode from RAID to AHCI.
