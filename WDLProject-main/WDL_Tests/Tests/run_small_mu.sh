#!/bin/bash 
for i in 24 26 28 30 32 34 36
do #Calls auto2 to try and automate things more
    for j in 10 100 1000 10000 
    do 
        sbatch run.sh $i $j true 
    done

done
