# Scripts Version-4.1 Introduction


<center>
    
</center>

```
Relationship:
									   Version-4.1
									   
									   installer.sh
									   		|
									   		|
									   	install.sh
									   		|
									   		|
									  environment.sh
									  |			   |
									  |			   |
								goAndNodejs.sh	docker.sh
									  |			   |
									  |			   |
									   \		  /
									  	 fabric.sh
									  	 	|
									  	 	|
									  	 Finished
									  	 
						You also need to check after install finished.
```

</center>


## 1. installer.sh

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;It provides method for you to choose install scripts version. I abandoned all version before Version 4.1 for their errors on 2020.04.06 Mon. This file will stay the same only keep updating version information continuously.

## 2. install.sh

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This script exists in branch of each version. It downloads cache and makes log files, installs the base software for the environment and check these software.

## 3. environment.sh

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;It will install base software on computer and download docker images.

## 4. fabric.sh

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;It will test the fabric network you need to check the result of it in log directory.

## 5. goAndNodejs.sh
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;It will install go1.13.4 and nodejs v8.9.4 for you.

## 6. images.sh
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;It will provides the list of the necessary docker images.
