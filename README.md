# AutoWebRecon v1.0.0  

A tool written in **Bash script** for automating website reconnaissance using built-in Kali Linux tools. It supports three recon modes — **Passive**, **Hybrid**, and **Aggressive** — and uses tools like Nmap, Nikto, Gobuster, and more to gather information such as open ports, technologies, WAFs, and potential vulnerabilities.

---

## Features

- **Passive Mode (Stealth Recon)**  
- **Hybrid Mode (Balanced Recon)**  
- **Aggressive Mode (Active Recon)**
  
---

## What’s New in v1.0.0

- Added all 3 Recon Modes (Passive, Hybrid, Aggressive)
- ASCII Header + Clean UI Layout
- flexible control flow (target prompt, mode selection)

---

## Previous Versions

Looking for older versions of AutoWebRecon before v1.0.0?

[Click here to browse the old versions inside the Bash-Resources Repo](https://github.com/R3ym0nd0/Bash-Resources/tree/main/AutoWebRecon)

> These were stored in a Bash-Resources repository before this tool got its own dedicated repo.

---

## Screenshot

![AutoWebRecon](https://github.com/user-attachments/assets/51c658e0-c18f-4dc2-aab8-58d6924d8fe9)

---

## Use Cases

- Quick recon on web targets from terminal
- Save time in CTFs or bug bounty recons  
- Beginner-friendly recon automation for students  
- Lightweight Bash-based tool, great for scripting or chaining

---

## How to Run

```bash
Designed for Kali Linux – all tools used are preinstalled. No extra setup needed.

# Clone the repo
git clone https://github.com/R3ym0nd0/AutoWebRecon.git
cd AutoWebRecon

# Make the script executable
chmod +x AutoWebRecon.sh

# Run the tool
./AutoWebRecon.sh
