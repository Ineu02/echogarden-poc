#!/usr/bin/env bash
set -euo pipefail
WEBROOT="/var/www/echogarden"

# 1) Install Nginx bila belum ada
if ! command -v nginx >/dev/null 2>&1; then
  apt update -y && apt install -y nginx curl
fi

# 2) Ambil index.html terbaru dari repo kamu
mkdir -p "$WEBROOT"
curl -fsSL https://raw.githubusercontent.com/Ineu02/echogarden-poc/main/index.html -o "$WEBROOT/index.html"

# 3) (opsional) favicon
curl -fsSL https://raw.githubusercontent.com/Ineu02/echogarden-poc/main/favicon.ico -o "$WEBROOT/favicon.ico" || true

# 4) Nginx server block
cat >/etc/nginx/sites-available/echogarden <<'NGINX'
server {
  listen 80;
  server_name _;
  root /var/www/echogarden;
  index index.html;
  location / { try_files $uri /index.html; }
}
NGINX
ln -sf /etc/nginx/sites-available/echogarden /etc/nginx/sites-enabled/echogarden
nginx -t && systemctl reload nginx

IP=$(curl -s https://ifconfig.me || echo "YOUR-VPS-IP")
echo "✅ EchoGarden deployed! Open: http://$IP/"
echo "Tip: add '?key=DevKey_xxx' to prefill the input. Example: http://$IP/?key=DevKey_demo"
