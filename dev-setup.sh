#!/usr/bin/env bash
GIT_CONFIG="$HOME/.gitconfig"
CONFIRM_ALL=${1}
GIT_USERNAME=$(git config user.name)
GIT_EMAIL=$(git config user.email)


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

brew update
brew cask install 1password
brew cask install google-chrome
brew cask install firefox
brew cask install pycharm
brew cask install iterm2
brew cask install slack
brew cask install spotify
brew cask install docker
brew cask install vagrant
brew cask install virtualbox
brew cask install java
brew cask install whatsapp
brew cask install tunnelblick

brew install vim --with-lua
brew install rg
brew install clojure

