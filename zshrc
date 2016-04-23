ZSH=$HOME/.oh-my-zsh

export EDITOR="nvim"

ZSH_THEME="garyblessington"

alias vimrc="nvim ~/.nvimrc"
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

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"

export MANPATH="/usr/local/man:$MANPATH"

export JAVA_HOME_7=$(/usr/libexec/java_home -v 1.7)
export JAVA_HOME_8=$(/usr/libexec/java_home -v 1.8)

alias java7='export JAVA_HOME=$JAVA_HOME_7'
alias java8='export JAVA_HOME=$JAVA_HOME_8'

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:/Users/ukutaht/.cargo/bin"

source ~/.localrc
eval "$(rbenv init -)"

function prune_branches() {
  git remote prune origin
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

function github()
{
 local location=$(grep -o -m 1 'github.*' .git/config)
 local url=$(cut -d ":" -f 2 <<< "$location")
 open "http://www.github.com/$url"
}

eval $(docker-machine env)

export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

echo '
      /╲ ︵╱\
     |(◉) (◉)|
      \︶V︶/
      /↺↺↺↺\
      ↺↺↺↺↺↺
      \↺↺↺↺/
    ¯¯/\¯¯/\¯¯'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
