# 🕵️‍♂️ School Recon Toolkit — `school_recon.sh`

> 🔥 Offensive Recon Script for Cybersecurity Students  
> 🎯 Simulates black hat-style reconnaissance on school domains (with permission)  
> 🛠️ Built by ZUES — modular, powerful, and hardware-ready

---

## 🚀 Features

- 🔍 Subdomain Enumeration (`subfinder`)
- 🌐 DNS Resolution (`dnsx`)
- 📡 HTTP Probing (`httpx`)
- 🚨 Vulnerability Scanning (`nuclei`)
- 👻 Subdomain Takeover Detection (`subzy`)
- 🧪 Directory Fuzzing (`ffuf`)
- 📸 Web Screenshots (`EyeWitness`)
- 🌍 External Exposure Check (`shodan`)
- 🧠 Modular design for GPIO or touchscreen integration

---

## 📦 Requirements

Install dependencies:

```bash
sudo apt update && sudo apt install curl whois nmap sslscan eyewitness python3-pip golang -y
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/LukaSikic/subzy@latest
go install github.com/ffuf/ffuf@latest
pip3 install shodan
