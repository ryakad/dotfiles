#! /bin/bash -
#
# Dotfiles
# Copyright (c) Ryan Kadwell <ryan@riaka.ca>
#
# Quick command to remove a project from sublime.
#
# Author: Ryan Kadwell <ryan@riaka.ca>
#

PROGRAM=$(basename $0)
OLDPROJECT="$1"

if [ -z $OLDPROJECT ]
then
   echo "Error: ${PROGRAM} You must provide the project name to remove" >&2
   exit 1
fi

if [ -d "${HOME}/Library/Application Support/Sublime Text 3/Local/" ]
then
   cd "${HOME}/Library/Application Support/Sublime Text 3/Local/"
elif [ -d "$HOME/.config/sublime-text-3/Local/" ]
then
   cd "$HOME/.config/sublime-text-3/Local/"
else
   echo "Error: ${PROGRAM} Can't find sublime's location" >&2
   exit 2
fi

sessionfile="Session.sublime_session"
tmpsessionfile="${sessionfile}.bak"

# Will overwrite old backup. We will intentionaly leave this file here incase
# we remove too vague a project and bullox things up.
mv "$sessionfile" "$tmpsessionfile"

# run the replace command
sed "/${1}/d" < "$tmpsessionfile" > "$sessionfile"
