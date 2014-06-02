#! /usr/bin/env bash
#
# Script for monitoring filesystem for changes
# Copyright (c) Ryan Kadwell <ryan@riaka.ca>
#
# Author: Ryan Kadwell <ryan@riaka.ca>
#

path="$1"

if ! [ -e "$path" ]
then
   echo "Error: $0 The path $path is invalid." >&2
   exit 1
fi

# Remaining args make up the command that will be run anytime a change is
# detected.
shift
run_command=$*

current_hash=0
previous_hash=$current_hash

echo "Watching \"$path\"."

until false
do
   current_hash=`ls -lR --time-style=full-iso $path | shasum`
   if [[ $current_hash != $previous_hash ]] ; then
      echo ">> $(date +"%Y-%m-%d %I:%M:%S") Running Command: \"$run_command\""
      $run_command
      previous_hash=$current_hash
   fi

   sleep 1
done
