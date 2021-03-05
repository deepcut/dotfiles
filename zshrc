if [ -d $HOME/.zsh.before/ ]; then
  if [ "$(ls -A $HOME/.zsh.before/)" ]; then
    for config_file ($HOME/.zsh.before/*.zsh) source $config_file
  fi
fi

## ZSH Settings
# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Command auto-correction.
ENABLE_CORRECTION="true"

## User config

# Enable colors
autoload -U colors && colors

# Basic auto/tab complete:
autoload -U compinit
# autoload -U +X compinit
# autoload -U +X bashcompinit

zstyle ':completion:*' menu yes select
zmodload zsh/complist
compinit -i
# bashcompinit
_comp_options+=(globdots)  # Include hidden files.

source ~/.dbt-completion.bash
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(ls -A $HOME/.zsh.after/)" ]; then
    for config_file ($HOME/.zsh.after/*.zsh) source $config_file
  fi
fi