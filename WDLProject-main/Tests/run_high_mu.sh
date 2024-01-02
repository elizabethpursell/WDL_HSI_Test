#!/bin/bash 
for i in  24 26 28 30 32 34 36
do #Calls auto2 to try and automate things more
    for j in 3 5 8 10 
    do 
        sbatch run.sh $i $j $false 
    done

done
