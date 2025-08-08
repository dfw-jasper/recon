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
|__ subfinder
├── resolved
├── httpx
├── nuclei
├── subzy
├── ffuf
├── eyewitness
└── shodan

## 📦 Clone the School Recon Toolkit
git clone https://github.com/yourusername/school-recon.git
cd school-recon

## 🛠️ Make the script executable
chmod +x school_recon.sh

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

chmod +x school_recon.sh
./school_recon.sh example.edu


## ⚠️ Legal & Ethical Use
     This tool is for educational and authorized use only. Always obtain written permission before scanning or probing any live
      system.
