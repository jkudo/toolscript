#stress count
stcon=3

#time interval(sec)
tmin=300

#stress interval (1,2,5,10,20,25,50)
stin=25

#processor count
num=`grep "processor" /proc/cpuinfo | wc -l`

st=$stin

for i in `seq $stcon`
do
   while [ $st -le 100 ]
   do
      stress-ng --cpu "$num" -l "$st" -t "$tmin"s
      echo $st
      st=`expr $st \+ $stin`
   done
   st=`expr $st \- $stin`
   st=`expr $st \- $stin`
   while [ $st -gt 0 ]
   do
      stress-ng --cpu "$num" -l "$st" -t "$tmin"s
      echo $st
      st=`expr $st \- $stin`
   done
done
