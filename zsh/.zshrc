export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  z
)

source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# bun completions
[ -s "/Users/jorge/.bun/_bun" ] && source "/Users/jorge/.bun/_bun"

# Eza
alias ls="eza --icons=always --oneline"
