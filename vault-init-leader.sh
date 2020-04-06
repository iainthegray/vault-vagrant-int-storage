#!/bin/bash

# Initialise Vault. Store keys locally FOR DEMO PURPOSES ONLY
INIT_OUT="/vagrant/init-output.txt"
VAULT_TXT="/vagrant/vault.txt"
export VAULT_ADDR=http://127.0.0.1:8200
systemctl start vault

sleep 5

vault operator init -key-shares=1 -key-threshold=1 > $INIT_OUT 2>&1

echo "Unseal:""$(grep Unseal $INIT_OUT | cut -d' ' -f4)" > $VAULT_TXT
echo "Token:""$(grep Token $INIT_OUT | cut -d' ' -f4)" >> $VAULT_TXT
# rm $INIT_OUT

# Unseal Vault
vault operator unseal "$(cat $VAULT_TXT | grep Unseal | cut -f2 -d':')"
vault login "$(cat $VAULT_TXT | grep Token | cut -f2 -d':')"
vault write sys/license text="$(cat licence.txt)"
chown vagrant /home/vagrant/.vault-token
