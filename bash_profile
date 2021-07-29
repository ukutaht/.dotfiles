HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export CLICOLOR=1
export CLICOLOR_FORCE=1
export EDITOR="nvim"

alias g='git'
alias rake='noglob rake'
alias be='bundle exec'
alias vim='nvim'
alias la='ls -lAh'

function prune_branches() {
  git remote prune origin
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

echo '
      /╲ ︵╱\
     |(◉) (◉)|
      \︶V︶/
      /↺↺↺↺\
      ↺↺↺↺↺↺
      \↺↺↺↺/
    ¯¯/\¯¯/\¯¯'
