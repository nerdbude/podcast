#!/bin/bash

echo "[-------------------]"
echo "[    log sorting    ]"
echo "[      ver. 0.1     ]"
echo "[-------------------]"
echo
# Define the path for the episode logs here
logpath="/home/pho/CODE/podstats/TEST/logs"
# Define path where to place new logs 
newpath="/home/pho/CODE/podstats/TEST/new_logs"
# Define log path for each episode.log
masterlog="/home/pho/CODE/podstats/TEST/logs/master.log"
episode0="/home/pho/CODE/podstats/TEST/logs/episode0.log" 
episode1="/home/pho/CODE/podstats/TEST/logs/episode1.log" 
episode2="/home/pho/CODE/podstats/TEST/logs/episode2.log" 
episode3="/home/pho/CODE/podstats/TEST/logs/episode3.log"

# Define the filesizes for each Episode to get the most acurate logentries
filesize_e0="11376985"
filesize_e1="14442099"
filesize_e2="67953039"
filesize_e3="" 


echo "[... checking log files]"
sleep 2
cd $logpath 
ls -l ./*.log
echo
echo "[..check for new log file]"
sleep 2
cd .. 
cd $newpath
ls -l ./*.log
echo
read -p "Enter the file you want to synchronize: " newlog
echo
echo "[synching logs]" 
read -p "do you want to sync log files? (y/n) " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then 
  cd $logpath
  mkdir cache
  cd ..
  cd $newpath
  cp $newlog $logpath/cache
  cd ..
  cd $logpath/cache
  # Change the path to the path where your audio files are
  grep "GET /podcast/audio/" $newlog > filtered.log
  
  # now filtering every single episode (you have to add a new line for a new episode)
  grep "GET /podcast/audio/CCH_000.mp3" filtered.log > f000.log
  grep "GET /podcast/audio/CCH_001.mp3" filtered.log > f001.log
  grep "GET /podcast/audio/CCH_002.mp3" filtered.log > f002.log
  grep "GET /podcast/audio/CCH_003.mp3" filtered.log > f003.log

  # now we are filtering only full downloads (canceled downloads won´t be counted)
  grep "200 $filesize_e0" f000.log > fs000.log
  grep "200 $filesize_e1" f001.log > fs001.log
  grep "200 $filesize_e2" f002.log > fs002.log
  grep "200 $filesize_e3" f003.log > fs003.log
  
  cat fs000.log $episode0 > episode0.log
  cat fs001.log $episode1 > episode1.log
  cat fs002.log $episode2 > episode2.log
  cat fs003.log $episode3 > episode3.log

  cp episode0.log $episode0
  cp episode1.log $episode1
  cp episode2.log $episode2
  cp episode3.log $episode3

  cat fs000.log fs001.log fs002.log fs003.log > fs_master.log
  cat $masterlog fs_master.log > final_master.log
  cp final_master.log $masterlog
  cd ..
  #rm -r cache
  cd ..
  cd $newpath
  rm $newlog

fi 
echo
echo "[DONE]"
