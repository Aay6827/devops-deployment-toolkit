# Linux Troubleshooting Handbook

## DevOps Deployment Toolkit — Module 01

A practical reference for junior DevOps engineers and application support professionals.

## 1. System Information

| Command | Purpose |
|---|---|
| `uname -a` | Kernel and system information |
| `hostname` | Display hostname |
| `hostnamectl` | Display system details |
| `uptime` | System uptime and load |
| `date` | Display current date and time |

## 2. CPU and Memory

| Command | Purpose |
|---|---|
| `lscpu` | CPU architecture and details |
| `nproc` | Number of available processors |
| `free -h` | Memory usage |
| `top` | Live process monitoring |
| `ps aux` | List running processes |

## 3. Disk and Filesystem

| Command | Purpose |
|---|---|
| `df -h` | Filesystem disk utilisation |
| `df -i` | Inode utilisation |
| `du -sh /path` | Directory size |
| `lsblk` | Block devices |
| `mount` | Mounted filesystems |

## 4. Processes and Services

| Command | Purpose |
|---|---|
| `systemctl status nginx` | Check service status |
| `systemctl restart nginx` | Restart a service |
| `systemctl list-units --type=service` | List services |
| `ps -ef` | Process listing |
| `kill -15 PID` | Request graceful process termination |

Replace nginx and PID with the appropriate service name and process ID.

## 5. Logs and Troubleshooting

| Command | Purpose |
|---|---|
| `journalctl -xe` | Inspect system journal errors |
| `journalctl -u nginx` | Inspect service logs |
| `tail -f /var/log/syslog` | Follow a log file |
| `grep -i error file.log` | Search for errors |
| `less file.log` | Read large log files |

Log locations vary across Linux distributions.

## 6. Networking

Additional useful commands:

- `ip addr` — inspect network interfaces.
- `ip route` — inspect routing table.
- `ping -c 4 example.com` — test connectivity.
- `ss -tulpn` — inspect listening ports.
- `curl -I https://example.com` — inspect HTTP response headers.
- `getent hosts example.com` — test name resolution.

## 7. Practical Troubleshooting Scenarios

### Scenario A: Disk utilisation is high

1. Run `df -h`.
2. Identify the affected filesystem.
3. Run `du -sh /path/*` on relevant directories.
4. Identify large files and investigate before removing anything.

### Scenario B: Application is not responding

1. Check application service status.
2. Inspect recent application logs.
3. Check CPU and memory utilisation.
4. Verify the application listening port.
5. Test its HTTP endpoint with curl.

### Scenario C: Server memory is high

1. Run `free -h`.
2. Run `ps aux`.
3. Identify processes consuming memory.
4. Investigate before restarting or terminating processes.

## 8. Operational Safety

- Investigate before restarting production services.
- Never delete logs without checking retention requirements.
- Avoid running commands as root unless necessary.
- Do not expose credentials, tokens or customer data.
- Confirm the target environment before executing changes.
- Follow change-management and incident-management procedures.

---

**Product:** DevOps Deployment Toolkit  
**Module:** 01 — Linux Troubleshooting  
**Edition:** Starter  
**Purpose:** Independent educational resource.

This handbook is a learning reference. Commands and procedures should be validated against the target Linux distribution and environment before operational use.
