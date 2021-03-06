# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/wanchengcheng/.oh-my-zsh

# Set JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ci="code-insiders"
# I want to keep /usr/local/bin ahead of /usr/bin, use vim in macvim instead of out-dated system-shipped vim7
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/Develop/scripting" # Add scripting directory to path.
export PATH="$PATH:$HOME/Develop/dotfiles"  # Add my dotfiles to path, there're some scripts there.
# export PATH="$HOME/anaconda/bin:$PATH"        # Add anaconda to path.
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/aliyun:$PATH"
export PATH="$HOME/.local/bin:$PATH"


# Flipboard/services envirnment requirements.
# export FL_CONFIG="$HOME/Work/flhome"
# export FL_DYNCONFIG="$HOME/Work/flhome/dynconfig"

#
export LC_ALL=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# Also check out --reverse option if you prefer "top-down" layout instead of the default "bottom-up" layout
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'


# tell Powerlevel9k to use the Nerd Fonts
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  custom_lambda dir vcs vi_mode
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# git branch icon, hide it.
POWERLEVEL9K_HIDE_BRANCH_ICON=true

POWERLEVEL9K_CUSTOM_LAMBDA="echo -n '\uFB26'"
POWERLEVEL9K_CUSTOM_LAMBDA_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_LAMBDA_BACKGROUND="cyan"

POWERLEVEL9K_VI_INSERT_MODE_STRING='I'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='N'

# Load Nerd Fonts with Powerlevel9k theme for Zsh
POWERLEVEL9K_MODE='nerdfont-complete'

# enable powerlevel9k theme
source  ~/powerlevel9k/powerlevel9k.zsh-theme

# https://github.com/athityakumar/colorls, colors.
alias lc='colorls -A --sd'
alias lcl='colorls -lA --sd'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

