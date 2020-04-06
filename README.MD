# Vault Vagrant project to initialize integrated storage

This initial repo uses shamir key shards as unseal type.

## Instructions
1. Download repo
2. Make sure the vagrant private network does not clash with any you have running
3. Run vagrant up
4. vagrant ssh vault-server-1
5. cd /vagrant; sudo ./vault-init-leader.sh
6. exit
7. vagrant ssh vault-server-2
8. cd /vagrant; sudo ./vault-init-follower.sh
9. exit
10. vagrant ssh vault-server-3
11. cd /vagrant; sudo ./vault-init-follower.sh
12. exit

Should be able to log into Vault on http://127.0.0.1:8200
