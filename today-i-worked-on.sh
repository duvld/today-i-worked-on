#!/bin/sh

# Keep a list of tasks worked on up to date!

# Init variables
theDate=$(date "+%b %a %d")
theDirStr='~/Documents/list-of-tasks/list-of-tasks'
theFile=~/Documents/list-of-tasks/list-of-tasks

# Command Line output styling
bold=$(tput bold)
normal=$(tput sgr0)

# Synconize from uploaded list
printf "****** Pulling newest changes from your repo ******\n"
git -C ~/Documents/list-of-tasks pull

# Read input
read -ep "What did you work on today? >>> " list

# Append input to list in the format `Jan Mon 01 | <Inputted text>`
echo "$theDate | $list" >> $theFile

# Output new additon to command line
printf "\n***** Added ${bold}\"%s\"${normal} to $theDirStr *****\n\n" "$theDate | $list"
cat $theFile
printf "\n"

# Commit new changes
git -C ~/Documents/list-of-tasks add .
git -C ~/Documents/list-of-tasks commit -m "$theDate"
git -C ~/Documents/list-of-tasks push
