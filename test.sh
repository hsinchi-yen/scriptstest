#!/bin/bash

#pre_define
#HALFDAY=43200
#ALLDAY=86400

secs_to_human() {
    if [[ -z ${1} || ${1} -lt 60 ]] ;then
        min=0 ; secs="${1}"
    else
        time_mins=$(echo "scale=2; ${1}/60" | bc)
        min=$(echo ${time_mins} | cut -d'.' -f1)
        secs="0.$(echo ${time_mins} | cut -d'.' -f2)"
        secs=$(echo ${secs}*60|bc|awk '{print int($1+0.5)}')
    fi
    echo "Time Elapsed : ${min} minutes and ${secs} seconds."
}

GetCurSecond()
{
  rseconds=$(date +%s)
  echo $rseconds
}

GetTime()
{
  rtime=$(date +"%Y-%m-%d %H:%M:%S")
  echo $rtime
}

timecount()
{
  for i in {1..5}; do
    echo -ne "$i"\\r
    sleep 1
  done
}

date +"%Y/%m/%d %H:%M:%S"
startsecs=$(GetCurSecond)
timediff=0
while [ $timediff -lt 30 ]; do
    echo "Test"
    GetTime
    timecount
    finalsecs=$(GetCurSecond)
    timediff=$(($finalsecs-$startsecs))
    secs_to_human $timediff
done
