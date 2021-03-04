#/bin/bash

echo "Update system softwareupdate"
softwareupdate --install

echo "Installing asdf plugins according to .tool-versions..."
asdf install

echo "Updating brew..."
brew update && brew upgrade
brew doctor

echo "Updating git submodules..."
git submodules update