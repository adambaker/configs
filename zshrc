source /etc/environment
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras lein cabal npm sudo)

#do this before loading oh-my-zsh so .zshrc.local can add plugins

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

bindkey -v
bindkey '^R' history-incremental-search-backward

alias t='TERM=screen-256color-bce tmux -u'
alias vim=nvim
alias vi=nvim
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

unsetopt correct_all
stty -ixon

export PATH=$HOME/bin:${PATH}

#put local customizations in .zshrc.local
if [ -e "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
