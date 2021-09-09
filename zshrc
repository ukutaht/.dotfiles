HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
bindkey -e
zstyle :compinstall filename '/Users/ukutaht/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

export CLICOLOR=1
export CLICOLOR_FORCE=1

. $HOME/.asdf/asdf.sh

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

alias g='git'
alias rake='noglob rake'
alias be='bundle exec'
alias vim='nvim'
alias la='ls -lAh'

ctags=/usr/local/bin/ctags

# User configuration
unsetopt correct_all

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:/Users/ukutaht/Library/Python/2.7/bin"
export MANPATH="/usr/local/man:$MANPATH"

function prune_branches() {
  git remote prune origin
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

export ERL_AFLAGS="-kernel shell_history enabled"

echo '
      /╲ ︵╱\
     |(◉) (◉)|
      \︶V︶/
      /↺↺↺↺\
      ↺↺↺↺↺↺
      \↺↺↺↺/
    ¯¯/\¯¯/\¯¯'
