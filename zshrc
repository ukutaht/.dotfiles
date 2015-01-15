ZSH=$HOME/.oh-my-zsh

export EDITOR="vim"

ZSH_THEME="garyblessington"

alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias code="cd ~/Desktop/code"
alias vim='/usr/local/Cellar/vim/7.4.430_1/bin/vim'
alias g='git'
alias rake='noglob rake'
alias be='bundle exec'

ctags=/usr/local/bin/ctags

plugins=(themes)

source $ZSH/oh-my-zsh.sh

# User configuration
unsetopt correct_all

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"

export MANPATH="/usr/local/man:$MANPATH"

export JAVA_HOME_7=$(/usr/libexec/java_home -v 1.7)
export JAVA_HOME_8=$(/usr/libexec/java_home -v 1.8)

alias java7='export JAVA_HOME=$JAVA_HOME_7'
alias java8='export JAVA_HOME=$JAVA_HOME_8'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
