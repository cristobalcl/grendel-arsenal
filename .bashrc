# Append to your "~/.bashrc".

#export TERM=xterm-256color
export PATH=$HOME/bin:$PATH
export CDPATH=$CDPATH:$HOME

export PS1="\[\033[1;34m\]\u@\H \[\033[1;33m\]\w\[\033[0m\]\$ "
export PROMPT_COMMAND=". prompt.sh"
export EDITOR=vim

#set -o vi

shopt -s cdspell

alias l='ls -hlA'
alias lo='ls -hlAtr'
alias ll='ls -hlASr'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- ,='cd -'
alias -- +='pushd .'
alias -- -='popd'
alias epwd='ls "`pwd`" -db'

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

? () { echo "$*" | bc -l; }

alias today='date +%F'
alias pylab='ipython -pylab'
alias wcat='wget -qO-'

alias here='pwd | xsel --clipboard'
alias there='cd "`xsel --clipboard`"'

alias vims='TERM=xterm-256color vim -S Session.vim'
alias vim='TERM=xterm-256color vim -p'

alias lost='tail ~/lost.txt; (cat >> ~/lost.txt)'
alias 7up='svn up'

alias privateOn='encfs ~/Dropbox/.private/ ~/Privado'
alias privateOff='fusermount -u /home/$USER/Privado'
