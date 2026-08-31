export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Tools configuration to respect XDG_*_HOME
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$HOME/.local/bin"
