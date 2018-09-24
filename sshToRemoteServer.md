## Adding your ssh key to remote server

1. ssh-keygen

2. To copy your generated keygen to remote server:
      
        ``ssh-copy-id -i ~/.ssh/mykey user@host``

3. Test: ssh -i ~/.ssh/mykey user@host
