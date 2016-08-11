#!/bin/bash

# create ansible.cfg file pointing to correct roles dir
printf '[defaults]\nroles_path=../' > ./ansible.cfg


if [ ! -e "./tests/test.yml" ]; then
        echo "Playbook ./tests/test.yml doesn't exist!"
        exit
fi

cp ./tests/test.yml ./temp_playbook.yml


if [ $(vagrant status | grep "ansible.*running" | wc -l) -eq "1" ]; then
        echo "Re-provisioning..."
        vagrant provision
else
        echo "Booting up the virtual machine..."
        vagrant up --provision
fi
