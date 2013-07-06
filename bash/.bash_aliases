#!/bin/bash
#
# My Bash Aliases
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>

# ls
alias la='ls -lahG'
alias l='ls -lhG'
alias l1='ls -1'

if [ $(uname) = "Linux" ]; then
  alias ls="ls --color=auto"
fi

# PHP Aliases
alias composer='composer --ansi'
alias cs-fixer='~/Projects/PHP-CS-Fixer/php-cs-fixer'
alias fix='~/Projects/PHP-CS-Fixer/php-cs-fixer fix'

alias o='open'

alias r="R CMD BATCH"

alias _="sudo"

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# OSX application aliases
alias sequel='open -a Sequel\ Pro'
alias chrome='open -a Google\ Chrome'
alias stree='open -a SourceTree'

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
# For Reference: mysql_config_editor set --host=locahost --user=... --password
alias ml='mysql'
alias mle='mysql -e'

alias py='python'
