alias rezsh="source ~/.zshrc"

# Dotfiles
alias dot="cd ~/.dotfiles"
alias redot="cd ~/.dotfiles; git pull; bash ~/.dotfiles/bin/symlinks_setup.sh; rezsh; cd ~"

# Vim
alias vi="nvim"

# Grep processes
alias pse='ps aux | grep elixir'
alias psn='ps aux | grep node'

# Elixir/Phoenix
alias exiex="source .env; iex -S mix"
alias exserve="source .env; iex -S mix phx.server"

# Personal convenience
alias smbe="cd ~/Documents/SM_Local/sm_umbrella/"
alias smfe="cd ~/Documents/SM_Local/sm_shopify_app/"
