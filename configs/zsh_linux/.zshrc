# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export FZF_BASE=$HOME/.fzf/bin/fzf

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=true

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(watson git dotenv dotnet zsh-autosuggestions zsh-syntax-highlighting ubuntu history-substring-search colored-man-pages colorize pip python kubectl zsh-vi-mode fzf-zsh-plugin tmux)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export WINDOWS_USERNAME="$(/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command 'dir Env:USERNAME | select-object -expandproperty VALUE' | tr -d '\r')"
export WINDOWS_DOWNLOADS="/mnt/c/Users/$WINDOWS_USERNAME/Downloads"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias jq="sed -E 's/[\x00-\x1F\x7F]//g' | tr -d '\000-\037' | jq"

alias r="radian"
alias ssh="TERM=screen ssh"
alias vim=nvim
alias explorer.exe="/mnt/c/Windows/explorer.exe"
alias code="/mnt/c/Users/$WINDOWS_USERNAME/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"
alias fd="fdfind"

export PATH="/mnt/c/Users/$WINDOWS_USERNAME/AppData/Local/Programs/cursor/resources/app/bin:$PATH"

function ntfy() {
    echo "Sending notification with message: $1"
    curl -d $1 "https://ntfy.devopsandmore.com/devops_notify"
} 

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

autoload -Uz compinit && compinit

export PATH="/snap/bin:$HOME/.local/bin:$PATH"
export PATH="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:$PATH"

source <(kubectl completion zsh)

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# n version manager
export PATH="$HOME/.local/.npm-global/bin:$PATH"
export PATH="$HOME/.local/n/bin:$PATH"
export N_PREFIX="$HOME/.local/n"

alias ls='exa --icons'
alias cat='batcat --style=plain,header'
alias cl='clear'

export GTK_THEME=Adwaita:dark

# custom scripts
export PATH="$HOME/scripts:$PATH"
alias fo=find_and_open.sh
alias on="cd $HOME/.notes && nvim ."
alias nn="new_note.sh"

export PATH=$HOME/.nimble/bin:$PATH

# miniforge
# export PATH="$HOME/conda/bin:$PATH"
export CONDA_BASE_PREFIX="$HOME/conda"
# source $HOME/conda/etc/profile.d/conda.sh  # commented out by conda initialize
# source $HOME/conda/etc/profile.d/mamba.sh

# /usr/bin/keychain $HOME/.ssh/id_rsa
# source $HOME/.keychain/UBUNTU-sh
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOST.sock
ALREADY_RUNNING=$(ssh-add -l > /dev/null; echo $?)

if [[ $ALREADY_RUNNING != "0" ]]; then
    if [[ -S $SSH_AUTH_SOCK ]]; then
        # not expecting the socket to exist as the forwarding command isn't running (http://www.tldp.org/LDP/abs/html/fto.html)
        rm $SSH_AUTH_SOCK
    fi
    ssh-add -l 2>/dev/null >/dev/null
    if [ $? -ge 2 ]; then
        ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
        ssh-add
    fi
fi

export NOTES="$HOME/.notes"
export TASKS="$HOME/.tasks"
export DOTFILES="$HOME/.dotfiles"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"

export LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda-12.8/bin:$PATH
export CUDA_HOME=/usr/local/cuda-12.8

export PATH="$HOME/.dotnet:$PATH"
export DOTNET_ROOT="$(dirname $(which dotnet))"

# export EDITOR=nvim

export OPENAI_API_KEY=$(cat ~/.secrets/rmopenai.secret)
export ANTHROPIC_API_KEY=$(cat ~/.secrets/anthropic.secret)
export GEMINI_API_KEY=$(cat ~/.secrets/gemini.secret)

# export XDG_RUNTIME_DIR="/tmp/"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/conda/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/conda/etc/profile.d/conda.sh" ]; then
        . "$HOME/conda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/conda/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "$HOME/conda/etc/profile.d/mamba.sh" ]; then
    . "$HOME/conda/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


# Homebrew shell completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
# Homebrew end

# Dotnet tools
export PATH="$PATH:~/.dotnet/tools"
# Dotnet tools end

eval "$(zoxide init --cmd cd zsh)"
eval $(thefuck --alias)

bindkey -s ^s "tmux-sessionizer.sh\n"
bindkey -s ^f "tmux-windowizer.sh\n"
bindkey -s ^w "tmux-windowizer.sh\n"

eval "$(uv generate-shell-completion zsh)"
