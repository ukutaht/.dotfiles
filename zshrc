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
alias vim='/usr/local/Cellar/vim/7.4.430_1/bin/vim'
alias gs='git status'
alias g='git'
alias rake='noglob rake'
ctags=/usr/local/bin/ctags

export JAVA_HOME_7=$(/usr/libexec/java_home -v 1.7)
export JAVA_HOME_8=$(/usr/libexec/java_home -v 1.8)

alias java7='export JAVA_HOME=$JAVA_HOME_7'
alias java8='export JAVA_HOME=$JAVA_HOME_8'


unsetopt correct_all

plugins=(git themes osx)

source $ZSH/oh-my-zsh.sh

alias be='bundle exec'

# User configuration

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"

export MANPATH="/usr/local/man:$MANPATH"


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
