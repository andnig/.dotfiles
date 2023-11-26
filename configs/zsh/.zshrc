# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE=/opt/homebrew/bin/fzf

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
plugins=(zsh-autosuggestions git vi-mode colored-man-pages colorize pip python zsh-syntax-highlighting)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

eval $(/opt/homebrew/bin/brew shellenv)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> for nvm <<<
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# >>> for nvm end <<<
export PATH="/Users/andre/.deta/bin:$PATH"

# zsh autocomplete for kubectl
source <(kubectl completion zsh)

# krew to path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

eval "$(pandoc --bash-completion)"

# pnpm
export PNPM_HOME="/Users/andre/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export VIRTUAL_ENV_DISABLE_PROMPT=true
eval "$(starship init zsh)"
alias ls='exa --icons'
alias cat='bat --style=plain,header'
alias cl='clear'

