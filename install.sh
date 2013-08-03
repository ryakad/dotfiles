#!/bin/bash
#
# Installation file for Dotfiles
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>
#

backup_dir="$HOME/.dotfile_backup"

if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir"
fi

# Moves a collection of files into another location.
#
# $1 - The directory where the files currently are in this repo
# $2 - The directory where the files are going
#
function move_files()
{
    source_dir="$1"
    target_dir="$2"
    for file in $(ls -a "$source_dir"); do
        if [ "$file" == ".." ] || [ "$file" == "." ]; then
            continue
        fi

        if [ -e "$target_dir/$file" ]; then
            cp "$target_dir/$file" "$backup_dir/$file.$(date +%Y-%m-%d).$$"
        fi

        echo "Installing \"$target_dir/$file\""
        cp "$source_dir/$file" "$target_dir/$file"
    done
}

move_files "./bash" "$HOME"
move_files "./git" "$HOME"
move_files "./osx" "$HOME"
move_files "./ghc" "$HOME"

# For installing sublime config files need to go in different locations
# depending on operating system.
linux_sublime_conf="$HOME/.config/sublime-text-3/Packages/User"
mac_sublime_conf="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

if [ -d "$linux_sublime_conf" ]; then
    sublime_conf="$linux_sublime_conf"
elif [ -d "$mac_sublime_conf" ]; then
    sublime_conf="$mac_sublime_conf"
else
    echo "Can not find sublime\'s user package."
fi

if [ ! -z "$sublime_conf" ]; then
    move_files "./sublime" "$sublime_conf"
fi
