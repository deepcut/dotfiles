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
  gh \
  exa \
  ranger \
  fzf \

# Install editor deps -- Emacs & Fonts
brew install emacs-plus --HEAD --with-modern-black-dragon-icon --with-no-titlebar
brew tap homebrew/cask-fonts 
brew install --cask font-source-code-pro
brew install --cask font-hack-nerd-font

# Install work deps
brew tap gigalixir/brew && brew install gigalixir
brew tap fishtown-analytics/dbt && brew install dbt
brew tap shopify/shopify
brew install shopify-cli
brew tap heroku/brew && brew install heroku

# ASDF
asdf plugin-add ruby
asdf plugin-add python
asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add nodejs
asdf plugin-add java
asdf plugin-update --all

# Tmux
# git clone "https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"

# Vim Utilities -- TO BE REMOVED
# yadr-vim-add-plugin --url=https://github.com/pangloss/vim-javascript
# yadr-vim-add-plugin --url=https://github.com/MaxMEllon/vim-jsx-pretty
