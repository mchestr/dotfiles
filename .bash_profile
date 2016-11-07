alias ls="ls -G"
alias ll="ls -GFlash"
alias dunset="unset ${!DOCKER_*}"
alias dev="cd ~/dev"

export M2_HOME=/usr/local/Cellar/maven/3.3.9/libexec
export JAVA_HOME=$(/usr/libexec/java_home)
export ANT_HOME=/usr/local/Cellar/ant/1.9.7/libexec

export SVN_EDITOR=vim

source ~/.gittools/git-completion.bash
source ~/.gittools/git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
