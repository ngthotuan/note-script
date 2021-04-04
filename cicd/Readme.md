1. On server generate ssh-key
+ -> public key to Github: Setting > Deploy keys

2. On local generate ssh-key
+ -> private key copy to Github SSH_KEY (3)
+ -> public key copy to Server: ~/.ssh/authorized_keys

3. Add 4 keys to  Github Secrets: SSH_HOST SSH_KEY SSH_PORT SSH_USERNAME