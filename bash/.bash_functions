#!/bin/bash
#
# My Bash Functions
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>


# cat the logfile that we are currently writing to
#
# $1 - display latest $1 lines
#
function wl()
{
    logfile=$(cwl)
    if [ -z "$1" ]; then
        echo "$(cat $logfile)"
    else
        echo "$(cat $logfile | tail -n${1})"
    fi
}

# get the current work log.
function cwl()
{
    echo "$HOME/.worklogs/$(ls $HOME/.worklogs | sort -r | head -n1)"
}

# Make a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript
    else # pipe
        python -mjson.tool | pygmentize -l javascript
    fi
}
