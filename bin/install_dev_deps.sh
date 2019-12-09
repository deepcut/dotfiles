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
