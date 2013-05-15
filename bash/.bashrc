# My Bash Initialization File
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>

export CDPATH=".:~:~/Projects"
export PS1='\h:\W \$ '
export PS2='→ '

config_files=(
    "$HOME/.bash_aliases"
    "$HOME/.bash_functions"
)

for file in ${config_files[@]}; do
    if [ -e $file ]; then
        source $file
    fi
done
