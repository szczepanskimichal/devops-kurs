set -euo pipefail

GREEN='\033[0;32m'
NC='\033[0m' # No Color

print_header() {
    echo -e "${GREEN}=== $1 ===${NC}"
}

print_header "Systeminformasjon"
echo "Dato: $(date)"
echo "Hostname: $(hostname)"
echo "Bruker: $(whoami)"
echo ""

print_header "Systemressurser"
echo "CPU-bruk:"
ps aux | awk '{print $3}' | grep -v '%CPU' | awk '{s+=$1} END {print s"%"}'
echo ""
echo "Minne:"
free -h | grep Mem
echo ""
echo "Disk:"
df -h / | tail -1
echo ""

print_header "Tjenester"
if systemctl is-active --quiet nginx; then
    echo "nginx: RUNNING ✓"
else
    echo "nginx: STOPPED ✗"
fi
echo ""

print_header "Nettverk"
echo "IP-adresse: $(hostname -I | awk '{print $1}')"
echo "Åpne porter:"
ss -tulpn | grep LISTEN | wc -l
echo "porter åpne"

