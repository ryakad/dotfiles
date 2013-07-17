#!/bin/bash
#
# My Bash Functions
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>


# get the current work log.
function cwl()
{
    echo "$HOME/.worklogs/$(ls $HOME/.worklogs | sort -r | head -n1)"
}

# cat the logfile that we are currently writing to
#
# $1 - Display latest $1 lines
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

# Make a new directory and enter it
function mkd()
{
    mkdir -p "$@" && cd "$@"
}

# Function for finding a file in the current directory
#
# $1     - The pattern to look for for the file
# $2     - The directory to base search in
# $3...n - Remaining Arguments passed through to find command
#
function f()
{
    find "${2:-.}" -name "*${1}*" ${@:3}
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json()
{
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript
    else # pipe
        python -mjson.tool | pygmentize -l javascript
    fi
}

# Finds a given field in a given database. Omitting the second field will
# list all columns in the database with a grep ""
#
# $1 - The database you want to list columns for.
#
function mlcols()
{
    database="$1"
    select_stmt="SELECT CONCAT(TABLE_NAME, '.', COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='$database';"
    for column in $(mysql -NBe "$select_stmt"); do
        echo $column
    done
}
