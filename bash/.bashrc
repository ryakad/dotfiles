#!/bin/bash
#
# My Bash Initialization File
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>

export BACKUP_DIR="$HOME/.backups"
export EDITOR="subl"

export GREP_COLOR=36

if [ ! -e $BACKUP_DIR ]; then
    mkdir -p "$BACKUP_DIR"
fi

config_files=(
    "$HOME/.bash_aliases"
    "$HOME/.bash_functions"
    "$HOME/.bash_completions"
    "$HOME/.bash_private" # machine specific customizations.
)

for file in ${config_files[@]}; do
    if [ -e $file ]; then
        source $file
    fi
done

# setup custom prompt.
prompt_file="$HOME/.bash_prompt"
tty -s && [ -e "$prompt_file" ] && source "$prompt_file"

# bash history customization
shopt -s histappend

# export HISTTIMEFORMAT='%F %T '
export HISTCONTROL="ignoreboth:erasedups"
export HISTIGNORE="l:la:l1:g:gaa:gc:clear:k:pwd:hist:history"
export HISTSIZE=5000
