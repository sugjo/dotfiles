# Created by newuser for 5.9

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit

# Keybindings
bindkey -v
bindkey '^[k' history-search-backward
bindkey '^[j' history-search-forward
bindkey '^[l' autosuggest-accept

export EDITOR=nvim
export VISUAL=nvim
export PATH=~/.scripts:$PATH
export PATH="${KREW_ROOT:-$HOME/.local/share/krew/}/bin:$PATH"

# History
HISTSIZE=5000
HISTFILE="$XDG_STATE_HOME"/zsh/history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias cd='z'
alias cat='bat'
alias ls='eza --no-filesize --long --icons=always --color=always --no-user'
alias ll='ls -la'
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias ssh='kitty +kitten ssh'
alias todo='todo.sh'
alias icat="kitten icat"
alias vim="nvim"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/zsh/theme.yaml)"

command -v flux >/dev/null && . <(flux completion zsh)

export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_CACHE_HOME="$HOME"/.cache

export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GOPATH="$XDG_DATA_HOME"/go
export FVM_CACHE_PATH="$XDG_CACHE_HOME"/fvm
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export KREW_ROOT="$XDG_DATA_HOME"/krew
export NVM_DIR="$XDG_DATA_HOME"/nvm
export WINEPREFIX="$XDG_DATA_HOME"/wine
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export PYTHON_HISTORY=$XDG_STATE_HOME/python_history

export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

export PATH="${HOME}/.local/bin":${PATH}
