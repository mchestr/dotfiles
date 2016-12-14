alias ls="ls -G"
alias ll="ls -GFlash"
alias dunset="unset ${!DOCKER_*}"
alias dev="cd ~/dev"
alias fixd="docker run -it --rm --privileged --pid=host debian nsenter -t 1 -m -u -n -i date -u $(date -u +%m%d%H%M%Y)"

export M2_HOME=/usr/local/Cellar/maven/3.3.9/libexec
export JAVA_HOME=$(/usr/libexec/java_home)
export ANT_HOME=/usr/local/Cellar/ant/1.9.7/libexec

export GOPATH=/Users/chemi11/dev/golang

export SVN_EDITOR=vim

source ~/.gittools/git-completion.bash
source ~/.gittools/git-prompt.sh
#PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="auto"
COLOR_OFF="\[\033[0m\]"
YELLOW="\[\033[0;33m\]"
PROMPT_COMMAND='__git_ps1 "${VIRTUAL_ENV:+[${YELLOW}$(basename $VIRTUAL_ENV)${COLOR_OFF}]}\u@\h:\w" "\\\$ "'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
