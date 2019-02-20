alias ls="ls -G"
alias ll="ls -GFlash"
alias dev="cd ~/dev"
alias npm-exec='PATH=$(npm bin):$PATH'

export PATH=$PATH:$HOME/dev/goroots/go1.10/bin:$HOME/dev/go/bin
export GOPATH=$HOME/dev/go
alias go14=$HOME/dev/goroots/go1.4/bin/go
alias go17=$HOME/dev/goroots/go1.7/bin/go
alias go18=$HOME/dev/goroots/go1.8/bin/go
alias gotip=$HOME/dev/goroots/gotip/bin/go

export SVN_EDITOR=vim

source ~/.gittools/git-completion.bash
source ~/.gittools/git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1
COLOR_OFF="\[\033[0m\]"
YELLOW="\[\033[0;33m\]"
PROMPT_COMMAND='__git_ps1 "${VIRTUAL_ENV:+[${YELLOW}$(basename $VIRTUAL_ENV)${COLOR_OFF}]}\u@\h:\w" "\\\$ "'

function halt-all() {
    local status=$(vagrant global-status | egrep  '^[a-f0-9]{7} ')
    for vid in $(echo "$status" | egrep -v '/devops *$' | awk '{print $1}');
    do
        vagrant halt $vid;
    done;
    vagrant halt $(echo "$status" | egrep '/devops *$' | awk '{print $1}')
}

function unhalt-devops() {
    local status=$(vagrant global-status | egrep  '^[a-f0-9]{7} ')
    vagrant up $(echo "$status" | egrep '/devops *$' | awk '{print $1}')
}


function unhalt-all() {
    local status=$(vagrant global-status | egrep  '^[a-f0-9]{7} ')
    vagrant up $(echo "$status" | egrep '/devops *$' | awk '{print $1}')
    for vid in $(echo "$status" | egrep -v '/devops *$' | awk '{print $1}');
    do
       vagrant up $vid;
    done;
}

alias vagfix='pushd . && cd && halt-all && unhalt-all && popd'
