#/bin/bash!

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


