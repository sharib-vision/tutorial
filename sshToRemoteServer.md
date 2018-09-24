## Adding your ssh key to remote server

1. ssh-keygen

2. To copy your generated keygen to remote server:
      
        ``ssh-copy-id -i ~/.ssh/mykey user@host``

3. Test: ssh -i ~/.ssh/mykey user@host


      Details see here:
      
      ``https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2``
