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
caskInstall google-chrome
caskInstall iterm2
caskInstall visual-studio-code
caskInstall slack
caskInstall spotify
caskInstall docker
caskInstall vagrant
caskInstall virtualbox
brewInstall rg
caskInstall java
brewInstall clojure

if [[ "$(readInput 'Setup VCS (y|n)? ') == "y" ]]; then
    gittoken=$(readInput "GitHub Token: ")
    gist=$(readInput "VCS Settings GitHub GIST: ")
    VCS_SETTINGS__DIR="$HOME/Library/Application Support/Code/User"
    VCS_SETTINGS_FILE="$VCS_SETTINGS_DIR/settings.json"
    VCS_SETTINGS_SYNC_FILE="$VCS_SETTINGS_DIR/syncLocalSettings.json"

    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension Shan.code-settings-sync
    python -c "import dev_setup;dev_setup.setup_vcs_settings('$VCS_SETTINGS_FILE', '$gist')"
    python -c "import dev_setup;dev_setup.setup_vcs_settings_sync('$VCS_SETTINGS_SYNC_FILE', '$gittoken')"
fi;

