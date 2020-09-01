#!/bin/sh

# Keep a list of tasks worked on up to date!

# Command Line output styling
bold=$(tput bold)
normal=$(tput sgr0)

# Read input
read -ep "What did you work on today? >>> " list

# Append input to list in the format `Jan Mon 01 | <Inputted text>`
echo "$(date "+%b %a %d") | $list" >> ~/.list-of-tasks

# Output new additon to command line
printf "\n***** Added ${bold}\"%s\"${normal} to ~/.list-of-tasks *****\n\n" "$(date "+%b %a %d") | $list"
cat ~/.list-of-tasks
printf "\n"
