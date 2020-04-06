#!/bin/bash

# A dreadful Vault setup script

export VAULT_ADDR=http://127.0.0.1:8200
export CONSUL_HTTP_ADDR=http://127.0.0.1:7500
VAULT_TXT="/vagrant/vault.txt"
vault login "$(cat $VAULT_TXT | grep Token | cut -f2 -d':')"

# create policies
vault policy write web_pol policies/web_pol.hcl

# Create the secrets backend
vault secrets enable -path=secret kv
# Create the secret to be used in the jenkins job jenkins-r1
vault kv put secret/web/db/secret passwd="wobble" username="bob"
