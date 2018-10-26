#!/usr/bin/env bash
GIT_CONFIG="$HOME/.gitconfig"
CONFIRM_ALL=${1}
GIT_USERNAME=$(git config user.name)
GIT_EMAIL=$(git config user.email)


function caskInstall {
    if [[ "$CONFIRM_ALL" != "y" ]]; then
        in=$(readInput "Install $1 (y|n)?")

        if [[ "$in" != "y" ]]; then
            return
        fi;
    fi;
    echo "Installing $1..."
    brew cask install $1
}


function brewInstall {
    if [[ "$CONFIRM_ALL" != "y" ]]; then
        in=$(readInput "Install $1 (y|n)?")

        if [[ "$in" != "y" ]]; then
            return
        fi;
    fi;
    brew install $1
}

function readInput {
    echo "$1"
    read in
    echo "$in"
}


if [[ "$GIT_USERNAME" == "" ]] && [[ "$GIT_EMAIL" == "" ]]; then

    echo "NAME for git? "
    read NAME
    git config --global user.name "$NAME"

    echo "EMAIL for git? "
    read EMAIL
    git config --global user.email "$EMAIL"

    sed "/$NAME/ s/$/ #gitignore/" "${GIT_CONFIG}" > "${GIT_CONFIG}_tmp"
    sed "/$EMAIL/ s/$/ #gitignore/" "${GIT_CONFIG}_tmp" > "${GIT_CONFIG}_tmp2"
    sed '/\[user\]/ s/$/ #gitignore/' "${GIT_CONFIG}_tmp2" > "${GIT_CONFIG}"
    rm "${GIT_CONFIG}_tmp"
    rm "${GIT_CONFIG}_tmp2"
fi;

if [[ "$CONFIRM_ALL" == "y" ]]; then
    echo "skipping install confirmations..."
fi;


which brew
if [[ "$?" -eq "1" ]]; then
    # Install Homebrew
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

brew update
caskInstall 1password
caskInstall google-chrome
caskInstall firefox
caskInstall pycharm
caskInstall iterm2
caskInstall slack
caskInstall spotify
caskInstall docker
caskInstall vagrant
caskInstall virtualbox
brewInstall rg
caskInstall java
brewInstall clojure
caskInstall whatsapp
caskInstall tunnelblick

