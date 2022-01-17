#!/bin/bash

#terminate if both arguments are empty
if [[ -z "$1" && -z "$2" ]]
then
	echo 'Usage: ./chkbackups.sh backupdirname [sourcedir]'
	exit 1
fi

#terminate if the directories are not valid
if [[ ! -d $1 ]]
then
	echo "Error!! $1 is not a valid directory"
	exit 1
fi

if [[ ! -z "$2" &&  ! -d $2 ]]
then
	echo " Error!! $2 is not a valid directory"
	exit 1
fi

#terminate if the source directory is empty
if [[ -z "$(ls $2)" ]]
then
	echo "Error!! $2 has no files"
	exit 1
fi

#check for backup files
date=$(date +%Y%m%d)
backupchk=true

for file in $(ls $2)
do
	if [[ ! -f $1/$file.$date ]]
	then
	echo "$file does not have a backup for today"
	backupchk=false
	fi
done

#if all backup files exists
if $backupchk
then
	echo "All files in $2 have backups for today in $1"
fi

exit 0
