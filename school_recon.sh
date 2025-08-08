#!/bin/bash


echo -e "\e[31m"
figlet "Bin Laden"
echo -e "\e[0m"
echo "🔍 Recon begins. Stay stealthy."
echo "----------------------------------------"

# school_recon.sh — Modular Recon Script for School Targets
# Author: ZUES
# Description: Performs subdomain enumeration, probing, vulnerability scanning, and visual recon.

TARGET=$1
WORDLIST="/usr/share/wordlists/dirb/common.txt"
DATE=$(date +%Y-%m-%d)
OUTPUT_DIR="recon_$TARGET_$DATE"
mkdir -p $OUTPUT_DIR

echo "🎯 Target: $TARGET"
echo "📁 Output Directory: $OUTPUT_DIR"
echo "----------------------------------------"

# [1] Subdomain Enumeration
echo "🔍 [1] Subfinder Enumeration..."
subfinder -d $TARGET -o $OUTPUT_DIR/subfinder.txt
echo "----------------------------------------"

# [2] DNS Resolution
echo "🌐 [2] DNSx Resolution..."
dnsx -l $OUTPUT_DIR/subfinder.txt -o $OUTPUT_DIR/resolved.txt
echo "----------------------------------------"

# [3] HTTP Probing
echo "📡 [3] HTTPX Probing..."
httpx -l $OUTPUT_DIR/resolved.txt -o $OUTPUT_DIR/httpx.txt
echo "----------------------------------------"

# [4] Vulnerability Scanning
echo "🚨 [4] Nuclei Scan..."
nuclei -l $OUTPUT_DIR/httpx.txt -o $OUTPUT_DIR/nuclei.txt
echo "----------------------------------------"

# [5] Subdomain Takeover Check
echo "👻 [5] Subzy Takeover Scan..."
subzy -targets $OUTPUT_DIR/resolved.txt -o $OUTPUT_DIR/subzy.txt
echo "----------------------------------------"

# [6] Directory Fuzzing
echo "🧪 [6] FFUF Directory Scan..."
ffuf -u https://$TARGET/FUZZ -w $WORDLIST -o $OUTPUT_DIR/ffuf.json
echo "----------------------------------------"

# [7] Visual Recon (Screenshots)
echo "📸 [7] EyeWitness Screenshots..."
EyeWitness -f $OUTPUT_DIR/httpx.txt --web --no-prompt -d $OUTPUT_DIR/eyewitness
echo "----------------------------------------"

# [8] External Exposure via Shodan (Optional)
echo "🌍 [8] Shodan Host Lookup..."
# Requires SHODAN_API_KEY to be set
if [ -n "$SHODAN_API_KEY" ]; then
  for ip in $(cat $OUTPUT_DIR/httpx.txt | cut -d '/' -f3 | cut -d ':' -f1); do
    echo "🔎 Shodan Lookup for $ip"
    shodan host $ip >> $OUTPUT_DIR/shodan.txt
  done
else
  echo "⚠️ Shodan API key not set. Skipping..."
fi
echo "----------------------------------------"

# [9] Summary
echo "✅ Recon Complete. Results saved in $OUTPUT_DIR"
echo "📂 Summary of Outputs:"
echo "🔍 Subfinder: $OUTPUT_DIR/subfinder.txt"
echo "🌐 DNSx: $OUTPUT_DIR/resolved.txt"
echo "📡 HTTPX: $OUTPUT_DIR/httpx.txt"
echo "🚨 Nuclei: $OUTPUT_DIR/nuclei.txt"
echo "👻 Subzy: $OUTPUT_DIR/subzy.txt"
echo "🧪 FFUF: $OUTPUT_DIR/ffuf.json"
echo "📸 EyeWitness: $OUTPUT_DIR/eyewitness"
echo "🌍 Shodan: $OUTPUT_DIR/shodan.txt"
