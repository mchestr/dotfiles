which brew
if [[ "$?" -eq "1" ]]; then
    # Install Homebrew
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

brew install vcsh
vcsh https://github.com/mchestr/dotfiles.git
vcsh dotfiles submodule init
vcsh dotfiles submodule update

./dev-setup.sh
