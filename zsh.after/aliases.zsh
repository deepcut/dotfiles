# Config Loading
alias zshconfig="vi ~/.zshrc"
alias lss='exa --long --header --git' # or 'ls -lAFh'
alias rezsh='source ~/.zshrc'
alias retmux='tmux source ~/.tmux.conf'
alias resymlink='sh ~/.bin/symlinks_setup.sh'
alias updateall='sh ~/.bin/updatedeps.sh'

# Dotfiles
alias dot="cd ~/.dotfiles"
alias redot="cd ~/.dotfiles; git pull; bash ~/.dotfiles/bin/symlinks_setup.sh; rezsh; cd ~"

# Vim
alias vi="nvim"
alias vim="nvim"

# Grep processes
alias pse='ps aux | grep elixir'
alias psn='ps aux | grep node'

# Node
alias ydev="clear; yarn dev"

# Elixir/Phoenix
alias exiex="source .env; iex -S mix"
alias exserve="source .env; iex -S mix phx.server"
alias exnuke="mix ecto.drop; mix ecto.create; mix ecto.migrate"

# Unalias from plugins
# Prezto git
unalias gp gm gpt gs
