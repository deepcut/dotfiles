#/bin/bash

echo_info() { tput setaf 2 && echo $1; tput sgr0; }
echo_warn() { tput setaf 1 && echo $1; tput sgr0; }

cd

echo_info "Installing basic dev tools..."
xcode-select --install
softwareupdate --install

# Install Brew
echo_info "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core deps
brew install git zsh
chsh -s $(which zsh) # default to zsh

# Install dotfiles
echo_info "Cloning dotfiles repo..."
git clone git@github.com:fadhguru/dotfiles.git ~/.dotfiles

# Prezto
if [ -d "$HOME/.zprezto" ] #&& [ -d "~/.dotfiles" ]
then
  echo_info "Prezto already installed - noop"
else
  echo "Installing Prezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  # setopt EXTENDED_GLOB
  # for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  #   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  # done

  echo_warn 'Note: If you already have any of the given configuration files, ln will cause error. Add the line `source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"` to the bottom of your .zshrc.'
  echo_info "installing prezto contrib..."

  cd $ZPREZTODIR
  git clone --recurse-submodules https://github.com/belak/prezto-contrib contrib
fi

## Tmux - TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Vim - VimPlugs
# regular vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Utilities
brew install --cask iterm2
brew install --cask firefox

cd ~/.dotfiles/bin/
source ./install_dev_deps.sh
source ./update_deps.sh
source ./symlinks_setup.sh