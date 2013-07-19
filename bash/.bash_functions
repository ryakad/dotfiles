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


# Script to reimport a database after first deleting the existing one
#
# $1 - the name of the database to use
# $2 - the path to the file we are going to import
#
# Usage:
#   mlimport [database_name] [file_to_import]
#
function mlimport()
{
    database="$1"
    import_file="$2"

    # check that they have given us a valid import file
    if ! [ -e $import_file ]; then
        echo "reimport: error: The import file you provided is not valid."
        return 1
    fi

    mysql -e "DROP DATABASE $database" &> /dev/null

    create_stmt="CREATE DATABASE $database DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"

    # we only care if the create fails. If the drop fails then it might just have
    # not been there in the first place.
    if ! mysql -e "$create_stmt" &> /dev/null; then
        echo "reimport: error: Failed setting up initial database"
        return 2
    fi

    if ! mysql "$database" < "$import_file" &> /dev/null; then
        echo "reimport: error: Failed importing new database"
        return 3
    fi
}
