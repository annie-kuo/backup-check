#!/bin/bash

#terminate if both arguments are empty
if [[ -z "$1" ||  -z "$2" ]]
then
	echo 'Usage: ./backup.sh backupdirname filetobackup'
	exit 1
fi

#terminate if the directory name is not valid
if [[ !  -d $1 ]]
then
	echo "Error!! $1 is not a valid directory"
	exit 1
fi

#terminate if the file name is not valid
if [[ ! -f $2 ]]
then
	echo "Error!! $2 is not a valid file"
	exit 1
fi

#create backup file name
date=$(date +%Y%m%d)
f="$(basename -- $2)"
backupname="$f.$date"

#terminate if such backup exists already
if [[ -f "$1/$backupname" ]]
then
	echo "Backup file already exists for $date"
	exit 1
fi

#otherwise, create backup
cp $2 $1/$backupname


exit 0
