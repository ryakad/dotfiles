#!/bin/bash
# Installation file for Dotfiles
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>
#

backup_dir="$HOME/.dotfile_backup"

bash_files=(
    ".bashrc"
    ".bash_functions"
    ".bash_aliases"
)

if [ ! -d $backup_dir ]; then
    mkdir "$backup_dir"
fi

for file in ${bash_files[@]}; do
    # backup existing files
    if [ -e "$HOME/$file" ]; then
        cp "$HOME/$file" "$backup_dir/$file.$(date +%Y-%m-%d).$$"
    fi

    cp "./bash/$file" "$HOME/$file"
done

source "$HOME/.bashrc"
