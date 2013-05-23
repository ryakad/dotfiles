# My Bash Functions
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>


#
# cat the logfile that we are currently writing to
#
# TODO: only take the latest $1 entries
#
function wl()
{
    logfile="$HOME/.worklogs/$(ls $HOME/worklogs | sort -r | head -n1)"
    echo -e "\nCurrent Log File: $logfile\n\n$(cat $logfile)\n"
}
