alias ls="ls -G"
alias ll="ls -GFlash"
alias dev="cd ~/dev"

export PATH=$PATH:$HOME/dev/goroots/go1.10/bin:$HOME/dev/golang/bin
export GOPATH=$HOME/dev/golang
alias go14=$HOME/dev/goroots/go1.4/bin/go
alias go17=$HOME/dev/goroots/go1.7/bin/go
alias go18=$HOME/dev/goroots/go1.8/bin/go
alias gotip=$HOME/dev/goroots/gotip/bin/go

alias ss='go run $HOME/dev/golang/src/github.com/mchestr/mine-tracker/main.go'

export SVN_EDITOR=vim

source ~/.gittools/git-completion.bash
source ~/.gittools/git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1
COLOR_OFF="\[\033[0m\]"
YELLOW="\[\033[0;33m\]"
PROMPT_COMMAND='__git_ps1 "${VIRTUAL_ENV:+[${YELLOW}$(basename $VIRTUAL_ENV)${COLOR_OFF}]}\u@\h:\w" "\\\$ "'

