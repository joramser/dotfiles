export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

export PATH="$HOME/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"

eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
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
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
