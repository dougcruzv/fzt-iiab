#!/bin/bash

apt update
apt -y dist-upgrade
apt -y clean

apt -y install git

mkdir -p /opt/iiab
cd /opt/iiab/
git clone https://github.com/iiab/iiab --depth 1
git clone https://github.com/iiab/iiab-admin-console --depth 1
git clone https://github.com/iiab/iiab-factory --depth 1

mkdir -p /etc/iiab/
cd /home/fzt-iiab/

cp local_vars.yml /etc/iiab/local_vars.yml

cd /opt/iiab/iiab/scripts/
./ansible

cd /opt/iiab/iiab/
./iiab-install

cd /opt/iiab/iiab-admin-console/
./install

export KALITE_HOME=/library/ka-lite
kalite manage generate_zone
# Register with KA Lite - just the anonymous registration
kalite manage retrievecontentpack download es
kalite manage retrievecontentpack download en
# Get KA Lite English language pack (slow download!)

cp /home/fzt-iiab/config.json /library/www/html/js-menu/

cp /home/fzt-iiab/menu.json /library/www/html/home/

#Copia de contenido
cd /home/fzt-iiab/./contenido.sh

