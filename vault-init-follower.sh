#!/bin/bash

# Initialise Vault. Store keys locally FOR DEMO PURPOSES ONLY
VAULT_TXT="/vagrant/vault.txt"
export VAULT_ADDR=http://127.0.0.1:8200
systemctl start vault

sleep 5

# Join Raft
vault operator raft join http://10.0.1.10:8200
# Unseal Vault
vault operator unseal "$(cat $VAULT_TXT | grep Unseal | cut -f2 -d':')"
