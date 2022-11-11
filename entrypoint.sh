#!/bin/sh

echo "Conecting..."

eval `ssh-agent`

mkdir -p ~/.ssh
chmod 700 ~/.ssh

ssh-keyscan $INPUT_HOST >> ~/.ssh/known_hosts

if [ "$INPUT_SSH_KEY" != "test" ]; then
    if [ "$INPUT_PASSPHRASE" != "" ]; then
        echo "ssh key passed and passphearse"
        echo 'echo "$INPUT_PASSPHRASE"' > ~/.ssh/tmp && chmod 700 ~/.ssh/tmp
        
        echo "$INPUT_SSH_KEY" | tr -d '\r' | DISPLAY=None SSH_ASKPASS=~/.ssh/tmp ssh-add -
        echo "=============Execute CMD================"
        ssh -o StrictHostKeyChecking=no $INPUT_USERNAME@$INPUT_HOST "$INPUT_SCRIPT"
        echo "=============Finally CMD================"
    else
        echo "ssh key passed"
        echo "$INPUT_SSH_KEY" | tr -d '\r' | ssh-add -
        echo "=============Execute CMD================"
        ssh -o StrictHostKeyChecking=no $INPUT_USERNAME@$INPUT_HOST "$INPUT_SCRIPT"
        echo "=============Finally CMD================"
    fi
else
    echo "not ssh key passed"
    echo "=============Execute CMD================"
    sshpass -p $INPUT_PASSPHRASE ssh -o StrictHostKeyChecking=no $INPUT_USERNAME@$INPUT_HOST "$INPUT_SCRIPT"
    echo "=============Finally CMD================"
fi


echo "coneccion finalizada..."
