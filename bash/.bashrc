# My Bash Initialization File
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>

export CDPATH=".:$HOME:$HOME/Projects"
export PS1='\h:\W \$ '
export PS2='→ '
export BACKUP_DIR="$HOME/.backups"

if [ ! -e $BACKUP_DIR ]; then
    mkdir -p "$BACKUP_DIR"
fi

config_files=(
    "$HOME/.bash_aliases"
    "$HOME/.bash_functions"
)

for file in ${config_files[@]}; do
    if [ -e $file ]; then
        source $file
    fi
done
