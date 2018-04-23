#### Where to put your data?

- Once you have ssh into the server, do below (this is private!):
```shell
	$ /well/rittscher/users/$yourName 
```

	(now from your local computer do below)
```shell	
	$ scp -r fullPathofYourLocalDirectoryThatYouWant2Copy username@rescomp1.well.ox.ac.uk:/well/rittscher/users/yourAccountName
```
	'OR'
```shell
	$ rsync -aP fullPathofYourLocalDirectoryThatYouWant2Copy username@rescomp1.well.ox.ac.uk:/well/rittscher/users/yourAccountName
```

- Extra software builds can be done inside project (this can be accessed by everyone else)

	- You will find softwares that are built locally or using an environment

	- make sure you are in the proper environment to be able to use it

	- never build something which is already available on the server

	- To check available softwares: 

```shell
    $ module avail
```

	
