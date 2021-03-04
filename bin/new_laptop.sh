#/bin/bash

softwareupdate --install
cd ~/.dotfiles/bin/
source ./install_dev_deps.sh
source ./update_deps.sh