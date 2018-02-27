#!/usr/bin/env bash
GIT_CONFIG="$HOME/.gitconfig"

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

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"



