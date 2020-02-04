#/bin/bash

# Brew
brew update && brew upgrade
brew install tmux neovim asdf

# ASDF
asdf plugin-add ruby
asdf plugin-add python
asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-update --all

# Tmux
git clone "https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"

# Vim Utilities
yadr-vim-add-plugin --url=https://github.com/pangloss/vim-javascript
yadr-vim-add-plugin --url=https://github.com/MaxMEllon/vim-jsx-pretty

# Utility CLIs
echo "Shopify CLI"
eval "$(curl -sS https://raw.githubusercontent.com/Shopify/shopify-app-cli/master/install.sh)"
