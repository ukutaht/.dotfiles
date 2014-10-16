# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# set vim as standard editor
export EDITOR="vim"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="garyblessington"

# aliases

alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias code="cd ~/Desktop/code"
alias projects"cd ~/projects"
alias ra="cd ~/projects/royal_academy"
alias vim='/usr/local/Cellar/vim/7.4.273/bin/vim'
alias gs='git status'
alias g='git'
alias rake='noglob rake'
ctags=/usr/local/bin/ctags

unsetopt correct_all

plugins=(git themes osx)

source $ZSH/oh-my-zsh.sh

alias be='bundle exec'

# User configuration

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
