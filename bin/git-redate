#! /bin/bash -
#
# dotfiles
# Copyright (c) Ryan Kadwell <ryan@riaka.ca>
#
# Quick script for re dating commits made in the past
#
# Author: Ryan Kadwell <ryan@riaka.ca>

commit="$1"
date_timestamp="$2"
temp_branch="temp-${$}"
current_branch="$(git rev-parse --abbrev-ref HEAD)"

if [ -z "$commit" ]
then
   echo "You must provide a commit to redate"
   exit 1
fi

# If no date is passed with this script we will assume that
if [ -z "$date_timestamp" ]
then
   date="$(date -R)"
else
   date="$date_timestamp"
fi

git checkout -b "$temp_branch" "$commit"
GIT_COMMITTER_DATE="$date" git commit --amend --date "$date"
git checkout "$current_branch"
git rebase "$commit" --onto "$temp_branch"
git branch -d "$temp_branch"
