#!/bin/bash
#
# My Bash Aliases
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# author: Ryan Kadwell <ryan@riaka.ca>

alias _="sudo"
alias hist="history"
alias k="clear"
alias o='open'
alias rm="rm -v"

# ls aliases
alias la='ls -lahG'
alias l='ls -lhG'
alias l1='ls -1'

if [ $(uname) = "Linux" ]; then
    alias ls="ls --color=auto"
fi

# cd
alias -- -="cd -"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# php aliases
alias composer='composer --ansi'
alias cs-fixer='~/Projects/PHP-CS-Fixer/php-cs-fixer'
alias fix='~/Projects/PHP-CS-Fixer/php-cs-fixer fix'

# r aliases
alias r="R CMD BATCH"

# tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# osx application aliases
alias sequel='open -a Sequel\ Pro'
alias chrome='open -a Google\ Chrome'
alias stree='open -a SourceTree'

# git aliases
alias g='git status'
alias ga='git add'
alias gaa='git add .'
alias gai='git add -i'
alias gap='git add -p'
alias gc='git commit'
alias gca='git commit -am'
alias gcm='git commit -m'
alias gd='git diff'
alias gdd='git diff --cached'
alias gf='git fetch'
alias gl1='git log --pretty="oneline"'
alias gl='git log'
alias gm='git checkout master'
alias gmm='git merge origin/master'
alias gp='git push'
alias gpo='git push -u origin'
alias grm='git rebase origin/master'

# svn aliases
alias s='svn status'
alias sa='svn add'
alias sb='svn blame'
alias sc='svn commit'
alias sd='svn diff'
alias sm='svn merge'

# mysql aliases
# For Reference: mysql_config_editor set --host=locahost --user=... --password
alias ml='mysql'
alias mle='mysql -e'

# python aliases
alias py='python'
