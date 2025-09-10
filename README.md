# EchoGarden — Soundness vAPP PoC (Static, no npm)

Demo front-end ringan untuk vAPP **EchoGarden** (branding, XP ticker, dan **Verifier Panel** 2 langkah).

## Live Demo
Masukkan IP/domain VPS kamu di sini:
- http://YOUR-VPS-IP/

## Fitur
- UI gradient warna-warni + confetti ringan
- "Plant Seed" dengan **Discord Dev Key** (bukan wallet)
- XP counter + multiplier simulasi
- **Verifier Panel – 2 Steps**:
  1. Paste **Walrus Blob ID** dari halaman “Game Complete”
  2. Paste **stdout** `soundness-cli send ...` → klik **Parse Output**
- Tombol **Copy Install** dengan fallback (jalan walau Clipboard API diblokir sandbox)

## Cara Jalankan (VPS, tanpa npm)
Sudah online? Cukup serve statis:
- Nginx root → `/var/www/echogarden/` (file `index.html` ini)

## Struktur
- `index.html` — single-file (Tailwind CDN + vanilla JS), no build.
- (opsional) `favicon.ico`

## Catatan
Parser CLI bersifat heuristik. Jika format log CLI berubah, sesuaikan pola regex di bagian JS (fungsi `parseCliOutput`).

## Kredit
- PoC oleh Ineu02 + asisten (EchoGarden branding). Tidak terafiliasi dengan Soundness.
