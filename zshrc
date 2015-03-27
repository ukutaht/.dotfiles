ZSH=$HOME/.oh-my-zsh

export EDITOR="nvim"

ZSH_THEME="garyblessington"

alias vimrc="nvim ~/.vimrc"
alias zshrc="nvim ~/.zshrc"
alias g='git'
alias rake='noglob rake'
alias be='bundle exec'
alias vim='nvim'

ctags=/usr/local/bin/ctags

plugins=(themes)

source $ZSH/oh-my-zsh.sh

# User configuration
unsetopt correct_all

# Run icepick with ^S
unsetopt flowcontrol

function insert-icepick-path-in-command-line() {
    local selected_path
    echo
    selected_path=$(find * -type f | icepick) || return
    eval 'LBUFFER="$LBUFFER$selected_path"'
    zle reset-prompt
}
zle -N insert-icepick-path-in-command-line
bindkey "^S" "insert-icepick-path-in-command-line"

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"

export MANPATH="/usr/local/man:$MANPATH"

export JAVA_HOME_7=$(/usr/libexec/java_home -v 1.7)
export JAVA_HOME_8=$(/usr/libexec/java_home -v 1.8)

alias java7='export JAVA_HOME=$JAVA_HOME_7'
alias java8='export JAVA_HOME=$JAVA_HOME_8'

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

source ~/.localrc
eval "$(rbenv init -)"

