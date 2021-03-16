#/bin/bash

# Only for fresh installs
xcode-select --install
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Brew
brew update && brew upgrade
brew install coreutils gcc automake autoconf openssl libyaml readline libxslt libtool unixodbc unzip curl git gpg fd ngrok ripgrep ag
brew install tmux neovim macvim asdf antigen gh
brew install exa ranger fzf neofetch bash-completion

# Install languages
# ASDF
brew install asdf
asdf plugin-add ruby
asdf plugin-add python
asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add java
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-previous-release-team-keyring'
asdf plugin-update --all
asdf install

# Install work deps
brew tap gigalixir/brew && brew install gigalixir
brew tap fishtown-analytics/dbt && brew install dbt
brew tap shopify/shopify
brew install shopify-cli
brew install themekit
brew tap heroku/brew && brew install heroku
