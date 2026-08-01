export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"

## Zsh
mkdir -p "$XDG_CACHE_HOME/zsh" "$XDG_STATE_HOME/zsh"

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space

## Completions
FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

eval "$(mise activate zsh)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

## Common
alias zz="zed ."
alias gb="gh browse"
alias hd="hunk diff"

## Eza
alias ls="eza --almost-all --icons=always --oneline"
alias la="eza --almost-all --icons=always --long --git"

## fzf
alias f="fzf --height=60% --layout=reverse --border --preview 'bat --color=always {}'"

## tmux
alias tmx="tmux new-session -A -s default"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Local configuration
[[ -f "$ZDOTDIR/local.zsh" ]] && source "$ZDOTDIR/local.zsh"
