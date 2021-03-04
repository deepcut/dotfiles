#/bin/bash

# Only for fresh installs
xcode-select --install
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Brew
brew update && brew upgrade
brew install \
  coreutils gcc automake autoconf openssl libyaml readline libxslt libtool unixodbc unzip curl git fd ngrok \
  tmux \
  neovim macvim \
  asdf \
  antigen \
  sublime-text \
  gh

# Install editor deps -- Emacs & Fonts
brew install emacs-plus --HEAD --with-modern-black-dragon-icon --with-no-titlebar
brew tap homebrew/cask-fonts 
brew install --cask font-source-code-pro
brew install --cask font-hack-nerd-font

# Install work deps
brew tap gigalixir/brew && brew install gigalixir
brew tap fishtown-analytics/dbt && brew install dbt

# ASDF
asdf plugin-add ruby
asdf plugin-add python
asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add nodejs
asdf plugin-add java
asdf plugin-update --all

# Tmux
git clone "https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"

# Vim Utilities
# yadr-vim-add-plugin --url=https://github.com/pangloss/vim-javascript
# yadr-vim-add-plugin --url=https://github.com/MaxMEllon/vim-jsx-pretty

# Utility CLIs
echo "Shopify CLI"
eval "$(curl -sS https://raw.githubusercontent.com/Shopify/shopify-app-cli/master/install.sh)"
