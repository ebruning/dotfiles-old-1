#!/bin/bash

# Taken from https://github.com/soffes/dotfiles/

DOTFILES_ROOT="$HOME/dotfiles"

echo "Changing shell…"
chsh -s /bin/zsh

echo "Installing Homebrew…"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
./scripts/homebrew.sh

echo "Symlinking macvim…"
ln -s /usr/local/bin/mvim /usr/local/bin/vi
ln -s /usr/local/bin/mvim /usr/local/bin/vim

echo "Installing Ruby…"
rbenv install 2.2.2
rbenv global 2.2.2

GEMS=(
    bundler
    cocoapods
    fastlane
    xcpretty
)
echo "Installing gems…"
gem install  ${GEMS[@]}

ln -s $DOTFILES_ROOT/vimrc $HOME/.vimrc
ln -s $DOTFILES_ROOT/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_ROOT/zshrc $HOME/.zshrc
ln -s $DOTFILES_ROOT/gemrc $HOME/.gemrc

echo "Writing system settings…"
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseHorizontalScroll -bool NO
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.dashboard mcx-disabled -boolean YES

echo "Installing vim-plug…"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing brew bundle…"
brew tap Homebrew/bundle

echo "Installing vim plugins…"
mvim +PlugUpdate

echo "Done."
