# Homelab Server & Network Security Platform

**Personal project · November 2026 – present · Active (Phase 2 of 4)**

A headless, two-node home server that protects every device on my network, streams a self-hosted media library to every screen in the house, and can be reached securely from anywhere without opening a single port. I manage it entirely remotely through SSH, a web console and scripted automation.

| | |
|---|---|
| **Hardware** | Dell OptiPlex 7080 Micro (i5-10500T, 32 GB, 1 TB NVMe) + Dell OptiPlex 3000 SFF |
| **OS** | Ubuntu Server 26.04 LTS on both nodes |
| **Core stack** | Docker, Pi-hole, Jellyfin, gluetun VPN gateway, NetBird, Cockpit |
| **Automation** | Bash, PowerShell, systemd timers |

## What it does

- **Protects the whole network.** Pi-hole filters ads, trackers and malware at the DNS layer for every phone, TV and laptop, with no setup on any device.
- **Streams media.** A self-hosted Jellyfin server streams my media library to every TV, phone and PC in the house. Containers that need outbound privacy route through a VPN gateway container with a kill switch, so they have no internet access if the tunnel drops.
- **Works securely from anywhere.** NetBird (WireGuard mesh) gives my devices the same access as at home. The media server has an SSO-protected browser link. No ports are open on the router.
- **Looks after itself.** A nightly job patches the OS and every container, checks 30+ health points, rolls back anything that breaks, and only reboots when needed.

## Architecture

```
                    Internet
                       |
              ISP fiber gateway  (NAT, Wi-Fi; DHCP handed off to Pi-hole)
                       |
      +----------------+-----------------+
      |                                  |
 OptiPlex 7080  (main node)         OptiPlex 3000  (worker node)
  - Pi-hole: DNS + DHCP for LAN      - extra compute
  - Jellyfin media server            - daily config backups
  - VPN gateway (kill switch)        - secondary Pi-hole (planned)
  - Cockpit + custom dashboard
  - NetBird routing peer
      |
  Remote devices -- NetBird (WireGuard) --> same addresses as at home
  Browser       -- NetBird reverse proxy + SSO --> Jellyfin only
```

## Highlights

- **Worked around a locked-down ISP router.** The gateway can't point clients at a custom DNS server, so I moved DHCP to Pi-hole and turned off the gateway's DHCP, with a documented rollback. Every device was protected automatically on its next lease.
- **Closed an IPv6 bypass.** Some devices were still getting ads. I traced it to the gateway's IPv6 router advertisements handing out its own DNS server, and shut that path.
- **Changed the network with no risk of lockout.** I moved the headless server from Wi-Fi to Ethernet with a 5-minute auto-revert timer. The revert was only cancelled once the new link was confirmed.
- **Ran a security audit and fixed what it found.** SSH and the web console were open to any address, password SSH had been silently re-enabled by cloud-init, and a VPN control API was exposed. I hardened both nodes with key-only SSH, LAN/VPN-only firewall rules, fail2ban jails and automatic security updates.
- **Set up zero-trust remote access.** I replaced port-forward-style access with a NetBird mesh: group-based access policies, split DNS for internal hostnames, and SSO in front of the only public-facing service.
- **Patched safely.** I replaced Watchtower's unchecked auto-updates with a single verified pipeline: wait for idle, update, run health checks, roll back automatically, then verify again after reboot.
- **Built a custom dashboard.** I wrote a Cockpit plugin in JavaScript that shows live host and DNS metrics, DHCP leases, container health with one-click restarts, remote-access status and the project docs.

## Key decisions

| Decision | Why |
|---|---|
| Ubuntu Server + Docker instead of Proxmox | Container-first workloads, simpler to script and learn |
| Pi-hole as the DHCP server | The only way to give every device filtered DNS behind the ISP gateway |
| NetBird instead of Tailscale or port forwarding | Mesh VPN plus a built-in SSO reverse proxy, with no inbound ports |
| Admin tools reachable only over the VPN | Admin panels should never face the internet, even behind a login |
| Config-only backups to the second node | The main node has one SSD; media is replaceable and configs aren't |

## Skills demonstrated

Linux administration · TCP/IP, DHCP, DNS · firewalling (UFW) · WireGuard / zero-trust access · Docker & Compose · Bash and PowerShell automation · systemd timers · incident troubleshooting and root-cause analysis · technical documentation

## What's next

- Switch the VPN gateway provider from ProtonVPN to Mullvad
- Run a full security stress test of both nodes
- Build a 10-inch mini rack with a Raspberry Pi 5, a PoE switch and a GL.iNet router, with VLANs for IoT and guest devices

**[Changelog →](CHANGELOG.md)**
