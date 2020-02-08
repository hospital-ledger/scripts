# Scripts 
</br>
&nbsp;&nbsp;&nbsp;&nbsp;These scripts can help us to set up the environment of the fabric quickly and easily. Although I have paste them into several files, there still some rules need to obey and follow. Firstly, you need to clone the scripts on the computer, maybe you can do like behind scripts, perhaps it is useful. Bless you. 
</br>
&nbsp;&nbsp;&nbsp;&nbsp;Oh, by the way, these scripts are provided for CentOS, maybe you can run correctly them on Red Hat you prochased, but you cannot run them correctly on Ubuntu and other Linux Systems which based on Debian. These scripts need to run on computer which based on CPU whose architecture is x86_64(amd64) for the binary exec files only support to compile based on x86_64(amd64), this is important, as a result you need to check the CPU firstly by script "arch" on terminal. Bless you again.
</br>
## Since the Version4.0, you can install the platform with One-Click method, it's vary easy.
</br>
~~~shell
cd /opt
git clone https://github.com/hospital-ledger/scripts.git
cd ./scripts
chmod +777 ./*
./install.sh
~~~
</br>
## /!\Good News. You can run it easily just do like these code upside. But you may need to do some other things if your cloud memory is less than 2G(2000M).
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
&nbsp;&nbsp;&nbsp;&nbsp;These scripts are provided by Tom on 06:57 A.M. 2020-02-04 Tue. - Version 1.0 -
</br>
&nbsp;&nbsp;&nbsp;&nbsp;These scripts are latest edited by Tom on 08:23 A.M. 2020-02-06 Thu. - Version 2.0 -
</br>
&nbsp;&nbsp;&nbsp;&nbsp;These scripts are latest edited by Tom at 10:00 A.M. on 2020-02-08 Sat. - Version 3.0 -

</br>
&nbsp;&nbsp;&nbsp;&nbsp;Now the Version 1.0 has been abandoned, I suggest you to use the Version 3.0.
</br>
&nbsp;&nbsp;&nbsp;&nbsp;  Nankai University 2020 Copyrights.  All Rights Reserved.
