#!/bin/sh

MAX_SLEEP="30s"
MAX_DISPLAY="35"

for i in *.asm
do 
    echo "Running assemble file: $i"
    m6502 -displaytime $MAX_DISPLAY -file $i &
    myPID=$!
    #sleep for so long
    sleep $MAX_SLEEP
    kill ${myPID}
done