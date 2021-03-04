# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ffw/.oh-my-zsh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias lss='exa --long --header --git' # or 'ls -lAFh'

. /opt/homebrew/opt/asdf/asdf.sh

eval "$(starship init zsh)"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

######
# Script for fixing brew between M1 & Intel
######
arch_name="$(uname -m)"

if [ "${arch_name}" = "x86_64" ]; then
    if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
        echo "Running on Rosetta 2"
        ARM=0
    else
        echo "Running on native Intel"
        ARM=0
    fi
elif [ "${arch_name}" = "arm64" ]; then
    echo "Running on ARM"
    ARM=1
else
    echo "Unknown architecture: ${arch_name}"
fi
echo "Arm Status: $ARM, $arch_name"

#Shellscript updates, imports from .bash_profile
#set PYTHONIOENCODING=UTF-8

export PATH=".:$PATH"

# brew path
if [ $ARM -eq 0 ]; then
    # intel
    echo "Rosetta2"
    # homebrew
    export PATH="/opt/local/bin:$PATH"
    # homebrew python
    export PATH="/usr/local/opt/python@3.9/libexec/bin:$PATH"
    export PATH="/usr/local/lib/python3.9/site-packages:$PATH"
    export PLAT="ROSETTA2"
    alias brew='arch -x86_64 /usr/local/bin/brew'
    alias virtualenv='arch -x86_64 python -m virtualenv ~/venvs/%*'
    export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
else
    echo "M1 Native!"
    # Homebrew
    export PATH="/opt/homebrew/bin:$PATH"
    # Homebrew - Python
    export PATH="/opt/homebrew/opt/python@3.9/libexec/bin:$PATH"
    export PATH="/opt/homebrew/lib/python3.9/site-packages:$PATH"
    # OpenSSH
    export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
    export PLAT="M1"
    alias brew='arch -arm64e /opt/homebrew/bin/brew'
    alias virtualenv='arch -arm64e python -m virtualenv ~/venvs/$*'
fi

