#!/bin/bash

for run in $(ls /home/aazzolini/gdebiase/hs_T2Tv2); do
    for seq in $(ls /home/aazzolini/gdebiase/hs_T2Tv2/${run} | grep mate); do
        gzip /home/aazzolini/gdebiase/hs_T2Tv2/${run}/${seq}
    done
done