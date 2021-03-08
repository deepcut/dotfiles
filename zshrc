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

# Autocomplete case sensitivity
CASE_SENSITIVE="false"

## User config

# Enable colors
autoload -U colors && colors

# Basic auto/tab complete:

# autoload -Uz compinit && compinit -i
# autoload -Uz bashcompinit && bashcompinit -i

autoload -U +X compinit && compinit -i
autoload -U +X bashcompinit && bashcompinit -i

zstyle ':completion:*' menu yes select
zmodload zsh/complist
_comp_options+=(globdots)  # Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Initialize prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Load after config
if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(ls -A $HOME/.zsh.after/)" ]; then
    for config_file ($HOME/.zsh.after/*.zsh) source $config_file
  fi
fi
