# My Bash Aliases
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>

# ls
alias la='ls -la';
alias ll='ll -l';

# PHP-CS-Fixer
alias cs-fixer='~/Projects/PHP-CS-Fixer/php-cs-fixer';
alias fix='~/Projects/PHP-CS-Fixer/php-cs-fixer fix';

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# OSX application aliases
alias sequel='open /Applications/Sequel\ Pro.app'
alias chrome='open /Applications/Google\ Chrome.app'

# git aliases
alias g='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -am'
alias ga='git add'
alias gaa='git add .'
alias gap='git add -p'
alias gai='git add -i'
alias gd='git diff'
alias gf='git fetch'
alias gp='git push'
alias gpo='git push -u origin'
alias gm='git checkout master'
alias gmm='git merge origin/master'
alias grm='git rebase origin/master'
alias gl='git log'
alias gl1='git log --pretty="oneline"'

# mysql
alias ml='mysql';
