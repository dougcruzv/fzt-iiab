#!/bin/bash -e

echo "Copia de archivos para configuracion de la FZT"

PLAYBOOK="iiab.yml"
INVENTORY="ansible_hosts"

ansible -m setup -i $INVENTORY localhost --connection=local >> /dev/null

ansible-playbook -i $INVENTORY $PLAYBOOK --connection=local
