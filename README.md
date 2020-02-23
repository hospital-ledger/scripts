# Quick Setup Scripts
&nbsp;&nbsp;&nbsp;&nbsp;/!\The master branch stop the support for Version-3.0 and early version, these version may run correctly with the installer-Version-3.0, the Version-4.0 manage the cache and bring into the log of the operations with new scripts for centos and ubuntu, these scripts are more moduler than before, you can check the log and restart the scripts for which not work correctly.
&nbsp;&nbsp;&nbsp;&nbsp;This is the first project of myself, there exist a lot of issues need to be solved. This installation depend on the Internet environment, if the Internet is good, these processes will cost about 4-6 hours with single-core computer, 3-4 hours with dual-core computer or higher configuration.
</br>
&nbsp;&nbsp;&nbsp;&nbsp;These scripts can help us to set up the environment of the fabric quickly and easily. Although I have paste them into several files, there still some rules need to obey and follow. Firstly, you need to clone the scripts on the computer, maybe you can do like behind scripts, perhaps it is useful. Bless you. 
</br>
&nbsp;&nbsp;&nbsp;&nbsp;Oh, by the way, these scripts are provided for CentOS, maybe you can run correctly them on Red Hat you prochased, but you cannot run them correctly on Ubuntu and other Linux Systems which based on Debian. These scripts need to run on computer which based on CPU whose architecture is x86_64(amd64) for the binary exec files only support to compile based on x86_64(amd64), this is important, as a result you need to check the CPU firstly by script "arch" on terminal. Bless you again.
</br>
&nbsp;&nbsp;&nbsp;&nbsp;Since the Version4.0, you can install the platform with One-Click method, it's vary easy.
</br>

~~~shell
cd /opt
git clone https://github.com/hospital-ledger/scripts.git
cd ./scripts
chmod +777 ./*
./install.sh
~~~

</br>
&nbsp;&nbsp;&nbsp;&nbsp;/!\Good News. You can run it easily just do like these code upside. But you may need to do some other things if your cloud memory is less than 2G(2000M).
</br>

~~~shell
cd /opt
git clone https://github.com/hospital-ledger/scripts.git
cd ./scripts/sh
chmod +777 ./*
./swap.sh
~~~

</br>
&nbsp;&nbsp;&nbsp;&nbsp;You can delete the swap space like the code behind.
</br>

~~~shell
cd /opt
git clone https://github.com/hospital-ledger/scripts.git
cd ./scripts/sh
chmod +777 ./*
./swapdelete.sh
~~~

</br>
&nbsp;&nbsp;&nbsp;&nbsp;I will show you the details of the setup/install.sh working method.
</br>

~~~shell
git clone https://github.com/hospital-ledger/scripts.git
cd ./scripts
chmod +777 ./first.sh
./first.sh
# You need to check the software at the bottom of the script output mentions, 
# if they are not installed correctly, you need to run them again or check the error information, 
# and search them on the Internet by yourself.
./second.sh
# You need to check the software at the bottom of the script output mentions, 
# if they are not installed correctly, you need to run them again or check the error information, 
# and search them on the Internet by yourself.
./final.sh
# If the terminal output the BIG "Start" and HUGE "End", it means the environment is well, 
# otherwise you need to check the error of it and fix it by searching the Internet by yourself.
~~~

</br>
&nbsp;&nbsp;&nbsp;&nbsp;The "first.sh" cost about twenty minutes on the test computer*, the "second.sh" cost about one hunderd and twenty minutes on the computer*, they don't need you to start at them, only check the result of the end of the script and make sure they are installed correctly. The "final.sh" need monitor at first, when you see the screen show the docker start to pull the image you can take a rest and about one hour later come back and check if there show the Big "Start" and Huge "End", that means the environment is well, or you need to check the error and fix it.
</br>
Docker images list:
</br>
REPOSITORY                     TAG                 IMAGE ID            CREATED             SIZE</br>
nginx                          latest              2073e0bcb60e        13 days ago         127MB</br>
hyperledger/fabric-tools       2.0                 639ab50feac9        2 weeks ago         514MB</br>
hyperledger/fabric-tools       2.0.0               639ab50feac9        2 weeks ago         514MB</br>
hyperledger/fabric-peer        2.0                 5f8a6b13db9f        2 weeks ago         57.2MB</br>
hyperledger/fabric-peer        2.0.0               5f8a6b13db9f        2 weeks ago         57.2MB</br>
hyperledger/fabric-orderer     2.0                 161632cc3c59        2 weeks ago         39.7MB</br>
hyperledger/fabric-orderer     2.0.0               161632cc3c59        2 weeks ago         39.7MB</br>
hyperledger/fabric-ccenv       2.0                 6514ca872b68        2 weeks ago         529MB</br>
hyperledger/fabric-ccenv       2.0.0               6514ca872b68        2 weeks ago         529MB</br>
hyperledger/fabric-baseos      2.0                 50075bc26291        2 weeks ago         6.9MB</br>
hyperledger/fabric-baseos      2.0.0               50075bc26291        2 weeks ago         6.9MB</br>
hyperledger/fabric-javaenv     2.0                 ac433f4353e4        3 weeks ago         507MB</br>
hyperledger/fabric-javaenv     2.0.0               ac433f4353e4        3 weeks ago         507MB</br>
alpine                         3.10                af341ccd2df8        3 weeks ago         5.56MB</br>
hyperledger/fabric-nodeenv     2.0                 c7fe428889ec        3 weeks ago         274MB</br>
hyperledger/fabric-nodeenv     2.0.0               c7fe428889ec        3 weeks ago         274MB</br>
hyperledger/fabric-nodeenv     latest              5f5b67437ca4        2 months ago        274MB</br>
hyperledger/fabric-javaenv     latest              4648059d209e        3 months ago        1.7GB</br>
hyperledger/fabric-ca          1.4                 62a60c5459ae        3 months ago        150MB</br>
hyperledger/fabric-ca          1.4.4               62a60c5459ae        3 months ago        150MB</br>
hyperledger/fabric-ca          latest              62a60c5459ae        3 months ago        150MB</br>
hyperledger/fabric-tools       latest              7552e1968c0b        3 months ago        1.49GB</br>
hyperledger/fabric-ccenv       latest              ca4780293e4c        3 months ago        1.37GB</br>
hyperledger/fabric-orderer     latest              dbc9f65443aa        3 months ago        120MB</br>
hyperledger/fabric-peer        latest              9756aed98c6b        3 months ago        128MB</br>
hyperledger/fabric-zookeeper   0.4.18              ede9389347db        3 months ago        276MB</br>
hyperledger/fabric-zookeeper   latest              ede9389347db        3 months ago        276MB</br>
hyperledger/fabric-kafka       0.4.18              caaae0474ef2        3 months ago        270MB</br>
hyperledger/fabric-kafka       latest              caaae0474ef2        3 months ago        270MB</br>
hyperledger/fabric-couchdb     0.4.18              d369d4eaa0fd        3 months ago        261MB</br>
hyperledger/fabric-couchdb     latest              d369d4eaa0fd        3 months ago        261MB</br>
hyperledger/fabric-baseos      latest              c256a6aad46f        3 months ago        80.8MB</br>
golang                         1.13.4-alpine       3024b4e742b0        3 months ago        359MB</br>
golang                         1.13.4-alpine3.10   3024b4e742b0        3 months ago        359MB</br>
</br>
&nbsp;&nbsp;&nbsp;&nbsp;These scripts are provided by Tom on 06:57 A.M. 2020-02-04 Tue. - Version 1.0 -
</br>
&nbsp;&nbsp;&nbsp;&nbsp;These scripts are latest edited by Tom on 08:23 A.M. 2020-02-06 Thu. - Version 2.0 -
</br>
&nbsp;&nbsp;&nbsp;&nbsp;These scripts are latest edited by Tom at 10:00 A.M. on 2020-02-08 Sat. - Version 3.0 -

</br>
&nbsp;&nbsp;&nbsp;&nbsp;Now the Version 1.0 has been abandoned, I suggest you to use the Version 3.0.
</br>
&nbsp;&nbsp;&nbsp;&nbsp;  Nankai University 2020 Copyrights.  All Rights Reserved.
