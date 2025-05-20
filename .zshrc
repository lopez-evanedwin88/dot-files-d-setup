# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Force login shell to ensure .zshrc is sourced
[[ -o login ]] || exec zsh -l

# Editor and aliases
export EDITOR='nvim'
alias v='nvim'
alias ff='dir=$(find . | fzf-tmux -p --reverse); nvim "$dir"'
alias android-pixel7-api34="cd $ANDROID_HOME/emulator && ./emulator -avd Pixel_7_API_34"
alias lesgd="cd ~/Development"

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=99999
SAVEHIST=99999
setopt appendhistory
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt share_history

# Initialize zoxide (replaces cd)
eval "$(zoxide init --cmd cd zsh)"

# Kubernetes aliases
alias k='kubectl'
alias kns='kubens'
alias ktx='kubectx'
alias kgps='kubectl get pods'
alias kgp='kubectl get pod'
alias kdes='kubectl describe'
alias kdel='kubectl delete'
alias kaf='kubectl apply -f'
alias klog='kubectl logs'

# Git aliases
alias gl='git log'
alias gc='git checkout'
alias gb='git branch'
alias gp='git pull'
alias gs='git status'
alias gps='git push'

# Lazydocker
alias lzd='lazydocker'

# eza (modern ls replacement)
if command -v eza &>/dev/null; then
  alias ls='eza'
  alias ll='eza -lhg'
  alias lla='eza -alhg'
  alias tree='eza --tree'
fi

# bat (modern cat replacement)
if command -v bat &>/dev/null; then
  alias cat='bat --paging=never --style=plain'
  alias catt='bat'
  alias cata='bat --show-all --paging=never'
fi

# Source zsh plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Initialize zsh-vi-mode
if [ -f "$(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]; then
  source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
  ZVM_VI_ESCAPE_BINDKEY=kj
  ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
  ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
  ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
  ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
  ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
  # Start in insert mode to mimic default zsh behavior
  ZVM_MODE_INSERT_START=true
fi

# Initialize fzf and restore keybindings
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
elif command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# Explicitly bind fzf keybindings to ensure Ctrl+R works
# if command -v fzf &>/dev/null; then
#   # Bind Ctrl+R for history search in both modes
#   bindkey '^R' fzf-history-widget
#   # Ensure other fzf bindings are available
#   bindkey '^T' fzf-file-widget
#   bindkey '^I' fzf-cd-widget
# fi

# Force fzf keybindings
# if command -v fzf &>/dev/null; then
#   # Unbind default Ctrl+R and Ctrl+S
#   bindkey -r '^R'
#   bindkey -r '^S'
#   # Bind fzf widgets
#   bindkey -M emacs '^R' fzf-history-widget
#   bindkey -M viins '^R' fzf-history-widget
#   bindkey -M vicmd '^R' fzf-history-widget
#   bindkey -M emacs '^T' fzf-file-widget
#   bindkey -M viins '^T' fzf-file-widget
#   bindkey -M vicmd '^T' fzf-file-widget
#   bindkey -M emacs '^I' fzf-cd-widget
#   bindkey -M viins '^I' fzf-cd-widget
#   # Optional: Bind Ctrl+S to fzf-history-widget (forward search)
#   bindkey -M emacs '^S' fzf-history-widget
#   bindkey -M viins '^S' fzf-history-widget
#   bindkey -M vicmd '^S' fzf-history-widget
# fi

# Customize fzf keybindings
if command -v fzf &>/dev/null; then
  # Unbind Tab to preserve Zsh completion
  bindkey -r '^I'
  # Bind fzf explicitly
  bindkey -M emacs '^R' fzf-history-widget
  bindkey -M viins '^R' fzf-history-widget
  bindkey -M emacs '^T' fzf-file-widget
  bindkey -M viins '^T' fzf-file-widget
  bindkey -M emacs '^I' fzf-cd-widget
  bindkey -M viins '^I' fzf-cd-widget
  # Bind Tab to Zsh completion
  # bindkey -M emacs '^I' complete-word
  # bindkey -M viins '^I' complete-word
fi

# Initialize starship prompt
eval "$(starship init zsh)"
