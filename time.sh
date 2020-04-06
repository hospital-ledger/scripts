#!/bin/bash
b=''
i=0
while [ $i -le  100 ]
do
	    printf "Progress:[%-101s]%d%%\r" $b $i
	        sleep 0.0005
		    i=`expr 1 + $i`   
				b=${b:0:i-1}     
		        b+=\=\>
		done
		echo

#echo "Well, there're still some important things to deal with, please wait."
i=0
list=("-","\\","|","/")
while [ $i -le 100 ]
do
		printf "Well, there're still some important things to deal with, please wait. - \r"
		sleep 0.1
		printf "Well, there're still some important things to deal with, please wait. \\ \r"
		sleep 0.1
		printf "Well, there're still some important things to deal with, please wait. | \r"
		sleep 0.1
		printf "Well, there're still some important things to deal with, please wait. / \r"  
		i=`expr 1 + $i`
		sleep 0.1
done

b=''
i=0
while [ $i -le  100 ]
do
	    printf "Progress:[%-101s]%d%%\r" $b $i
	        sleep 0.01
		    i=`expr 1 + $i`        
		        b=${b:0:i-1}
				b+=\=\>
		done
		echo
echo "Well, all done."
