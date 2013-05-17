# My Bash Aliases
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>

# ls
alias la='ls -lah'
alias l='ls -lh'

# PHP-CS-Fixer
alias cs-fixer='~/Projects/PHP-CS-Fixer/php-cs-fixer'
alias fix='~/Projects/PHP-CS-Fixer/php-cs-fixer fix'

alias o='open'
alias .='echo $PWD' # sometimes knowing the current folder is not enough

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
alias gdd='git diff --cached'
alias gf='git fetch'
alias gp='git push'
alias gpo='git push -u origin'
alias gm='git checkout master'
alias gmm='git merge origin/master'
alias grm='git rebase origin/master'
alias gl='git log'
alias gl1='git log --pretty="oneline"'

# svn aliases
alias s='svn status'
alias sd='svn diff'
alias sb='svn blame'
alias sa='svn add'
alias sc='svn commit'
alias sm='svn merge'

# mysql
alias ml='mysql'
