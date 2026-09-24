HISTFILE="$HOME/.histfile"
HISTSIZE=1000
SAVEHIST=1000
setopt append_history extended_history hist_expire_dups_first hist_ignore_dups
setopt hist_ignore_space hist_verify inc_append_history
bindkey -e

export CLICOLOR=1
export EDITOR=nvim
export ERL_AFLAGS="-kernel shell_history enabled"

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

if [[ -n "${HOMEBREW_PREFIX:-}" && -s "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh" ]]; then
  source "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"
fi

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
ulimit -n 1240
unsetopt correct_all

alias g='git'
alias rake='noglob rake'
alias be='bundle exec'
alias vim='nvim'
alias la='ls -lAh'

prune_branches() {
  git remote prune origin
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

export BUN_INSTALL="$HOME/.bun"
typeset -U path PATH
path=("$HOME/.npm-global/bin" "$HOME/.cargo/bin" "$BUN_INSTALL/bin" $path)

[[ -s "$HOME/.config/envman/load.sh" ]] && source "$HOME/.config/envman/load.sh"
[[ -s "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"
command -v boxd >/dev/null 2>&1 && source <(boxd completions zsh)
