HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '/Users/ukutaht/.zshrc'

autoload -Uz compinit
compinit

export EDITOR="nvim"

alias g='git'
alias rake='noglob rake'
alias be='bundle exec'
alias vim='nvim'

ctags=/usr/local/bin/ctags

# User configuration
unsetopt correct_all

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:/Users/ukutaht/.cargo/bin"
export MANPATH="/usr/local/man:$MANPATH"

export JAVA_HOME_7=$(/usr/libexec/java_home -v 1.7)
export JAVA_HOME_8=$(/usr/libexec/java_home -v 1.8)

alias java7='export JAVA_HOME=$JAVA_HOME_7'
alias java8='export JAVA_HOME=$JAVA_HOME_8'


source ~/.localrc
eval "$(rbenv init -)"

function prune_branches() {
  git remote prune origin
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/ukutaht/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/ukutaht/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/ukutaht/.fzf/man* && -d "/Users/ukutaht/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/ukutaht/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/ukutaht/.fzf/shell/completion.zsh" 2> /dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/.cargo/env

echo '
      /╲ ︵╱\
     |(◉) (◉)|
      \︶V︶/
      /↺↺↺↺\
      ↺↺↺↺↺↺
      \↺↺↺↺/
    ¯¯/\¯¯/\¯¯'

