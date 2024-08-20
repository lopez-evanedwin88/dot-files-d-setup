# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias android-pixel7-api34="cd $ANDROID_HOME/emulator && ./emulator -avd Pixel_7_API_34"
alias vi="nvim"
EDITOR='nvim'
alias lesgd="cd ~/Development"

eval "$(starship init zsh)"

# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/atomic.omp.json)"

# eval "$(fzf --zsh)"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

eval "$(zoxide init --cmd cd zsh)"

#quick Commands kubernetes
alias k=kubectl
alias kns=kubens
alias ktx=kubectx
alias kgps='kubectl get pods'
alias kgp='kubectl get pod'
alias kdes='kubectl describe'
alias kdel='kubectl delete'
alias kaf='kubectl apply -f'
alias klog='kubectl logs'
