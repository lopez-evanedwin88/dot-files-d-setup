# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias android-pixel7-api34="cd $ANDROID_HOME/emulator && ./emulator -avd Pixel_7_API_34"
alias v="nvim"
EDITOR='nvim'
alias lesgd="cd ~/Development"

eval "$(starship init zsh)"

# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/atomic.omp.json)"

# eval "$(fzf --zsh)"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt share_history

eval "$(zoxide init --cmd cd zsh)"

#quick commands kubernetes
alias k=kubectl
alias kns=kubens
alias ktx=kubectx
alias kgps='kubectl get pods'
alias kgp='kubectl get pod'
alias kdes='kubectl describe'
alias kdel='kubectl delete'
alias kaf='kubectl apply -f'
alias klog='kubectl logs'

#quick commands git
alias gl='git log'
alias gc='git checkout'
alias gb='git branch'
alias gp='git pull'
alias gs='git status'
alias gps='git push'
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh)

# This config is based on https://github.com/linkarzu/dotfiles-latest/blob/main/zshrc/zshrc-file.sh
if command -v eza &>/dev/null; then
  alias ls='eza'
  alias ll='eza -lhg'
  alias lla='eza -alhg'
  alias tree='eza --tree'
fi

if command -v bat &>/dev/null; then
  # --style=plain - removes line numbers and git modifications
  # --paging=never - doesnt pipe it through less
  alias cat='bat --paging=never --style=plain'
  alias catt='bat'
  alias cata='bat --show-all --paging=never'
fi

if [ -f "$(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]; then
  source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
  # Following 4 lines modify the escape key to `kj`
  ZVM_VI_ESCAPE_BINDKEY=kj
  ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
  ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
  ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY

  # Disable the cursor style feature
  # I my cursor above in the cursor section
  # https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#custom-cursor-style
  #
  # NOTE: My cursor was not blinking when using wezterm with the "wezterm"
  # terminfo, setting it to a blinking cursor below fixed that
  # I also set my term to "xterm-kitty" for this to work
  #
  # This also specifies the blinking cursor
  # ZVM_CURSOR_STYLE_ENABLED=false
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
  ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
  ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE

  # Source .fzf.zsh so that the ctrl+r bindkey is given back fzf
  zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')
fi
