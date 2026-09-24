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
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
ulimit -n 1240


export CLICOLOR=1

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

if [[ -n "${HOMEBREW_PREFIX:-}" && -s "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh" ]]; then
  source "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"
fi

export EDITOR="nvim"

alias g='git'
alias rake='noglob rake'
alias be='bundle exec'
alias vim='nvim'
alias la='ls -lAh'


# User configuration
unsetopt correct_all

function prune_branches() {
  git remote prune origin
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

export ERL_AFLAGS="-kernel shell_history enabled"
export PATH="$HOME/.npm-global/bin:$HOME/.cargo/bin:$PATH"

echo '
      /╲ ︵╱\
     |(◉) (◉)|
      \︶V︶/
      /↺↺↺↺\
      ↺↺↺↺↺↺
      \↺↺↺↺/
    ¯¯/\¯¯/\¯¯'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# >>> boxd completions >>>
# Managed by `boxd completions --install`; do not edit between markers.
if [ -n "${ZSH_VERSION:-}" ]; then
  whence compdef >/dev/null || { autoload -Uz compinit && compinit; }
  command -v boxd >/dev/null && source <(boxd completions zsh)
fi
# <<< boxd completions <<<
