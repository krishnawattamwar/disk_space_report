#!/bin/sh
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge 80 ]; then
    echo "Server is Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date) \nNeed to done maintenance activity on $(hostname) as soon as possbile \n\n\nRegards, \nTeam It-Support" | mail -s "Alert: Almost out of disk space $usep%" krishna.wattamwar@graymatrix.com #kalpesh.shedge@graymatrix.com faiyaz.siddiqui@graymatrix.com itsupport@graymatrix.com
  fi
done
