# Add to your "~/.bashrc".

export PS1="\[\033[1;34m\]\u@\H \[\033[1;33m\]\w\[\033[0m\]$ "
export EDITOR=vim
#export PATH=$HOME/bin:$PATH
export CDPATH=$CDPATH:$HOME

shopt -s cdspell

alias l='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias -- ,='cd -'
alias -- +='pushd .'
alias -- -='popd'

? () { echo "$*" | bc -l; }
