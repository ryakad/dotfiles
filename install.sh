#!/bin/bash
# Installation file for Dotfiles
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>
#

backup_dir="$HOME/.dotfile_backup"

if [ ! -d $backup_dir ]; then
    mkdir "$backup_dir"
fi

function say_and_do()
{
    echo "$1"
    eval "$1"
}

# copy bash files
for file in $(ls -a ./bash); do
    if [ "$file" == ".." ] || [ "$file" == "." ]; then
        continue
    fi

    if [ -e "$HOME/$file" ]; then
        cp "$HOME/$file" "$backup_dir/$file.$(date +%Y-%m-%d).$$"
    fi

    say_and_do "cp ./bash/$file $HOME/$file"
done

# copy git files
for file in $(ls -a ./git); do
    if [ "$file" == ".." ] || [ "$file" == "." ]; then
        continue
    fi

    if [ -e "$HOME/$file" ]; then
        cp "$HOME/$file" "$backup_dir/$file.$(date +%Y-$m-$d).$$"
    fi

    say_and_do "cp ./git/$file $HOME/$file"
done

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
    for file in $(ls -a ./sublime); do
        if [ $file == "." ] || [ $file == ".." ]; then
            continue
        fi

        if [ -e "$sublime_conf/$file" ]; then
            cp "$sublime_conf/$file" "$backup_dir/$file.$(date +%Y-%m-%d).$$"
        fi

        say_and_do "cp \"./sublime/$file\" \"$sublime_conf/$file\""
    done
fi
