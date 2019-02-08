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

#cp /home/fzt-iiab/menu.json /library/www/html/home/

# Copia de openstreetmap
#Comentar si no tienes el disco duro

rsync -P /mnt/contenido2019/openstreetmap.tar.gz /library/www/html/modules/

rsync -P /mnt/contenido2019/wikipedia.tar.gz /library/working/zims/

rsync -P /mnt/contenido2019/kalite.tar.gz /library/ka-lite/content/

rsync -rP /mnt/contenido2019/es-blockly-games /library/www/html/modules/

rsync -rP /mnt/contenido2019/en-scratch /library/www/html/modules/

cd /library/www/html/modules/

tar -zxvf openstreetmap.tar.gz

rm openstreetmap.tar.gz

#Copia de wikipedia
#Comentar si no tienes el disco duro

cd /library/working/zims/

tar -zxvf wikipedia.tar.gz

rm wikipedia.tar.gz

chmod 755 /opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/*

/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh gutenberg_es_all_2018-10.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh vikidia_es_all_novid_2018-10.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh wikibooks_es_all_novid_2018-06.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh wikinews_es_all_novid_2018-10.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh wikipedia_es_all_novid_2018-04.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh wikipedia_es_medicine_2018-10.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh wikiquote_es_all_novid_2018-06.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh wikisource_es_all_novid_2018-06.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh wikiversity_es_all_novid_2018-06.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh wikivoyage_es_all_novid_2018-06.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh wiktionary_es_all_novid_2018-10.zim
/opt/iiab/iiab-admin-console/roles/cmdsrv/files/scripts/./zim_install_move.sh wikiquote_es_all_novid_2018-06.zim

#Copia de ka-lite
#Comentar si no tienes el disco duro

cd /library/ka-lite/content/

tar -zxvf kalite.tar.gz

rm kalite.tar.gz

#Copia de Blockly-games
#Comentar si no tienes el disco duro

#rsync -rP /mnt/contenido2019/es-blockly-games /library/www/html/modules/

#Copia de Scratch
#Comentar si no tienes el disco duro

#rsync -rP /mnt/contenido2019/en-scratch /library/www/html/modules/


#/home/fzt-iiab/./contenido.sh
