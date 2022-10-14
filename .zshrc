# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# zsh-syntax-highlighting 必须是最后一个
plugins=(tmux git autojump zsh-autosuggestions zsh-syntax-highlighting)

# ZSH_TMUX_AUTOSTART=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#2ac3de,bg=#273644"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

#- zsh ---------------------------------------------------
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh
eval "$(starship init zsh)"

# alias ------------------------------------------------------
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias buou="brew update && brew outdated && brew upgrade && brew cleanup"
alias del="rmtrash"
alias l="ls -alh"
alias lg="lazygit"

alias note="vim ~/github/docs/index.md"
alias brain="vim ~/github/docs/index.md"
alias glide="vim ~/github/docs/glide.md"

alias ssh-cube="ssh -i ~/.ssh/cubecloud 103.170.72.154"
alias ssh-justhost="ssh -i ~/.ssh/cubecloud 209.209.114.121"

# proxy -----------------------------------------------------
alias ip="curl -i cip.cc"
export SOCKS5_ADDR="socks5://127.0.0.1:1086"
export HTTP_ADDR="http://127.0.0.1:1086"
function proxy() {
    export all_proxy="$SOCKS5_ADDR"
    export http_proxy="$HTTP_ADDR"
    export https_proxy="$HTTP_ADDR"
    export ALL_PROXY="$SOCKS5_ADDR"
    export HTTP_PROXY="$HTTP_ADDR"
    export HTTPS_PROXY="$HTTP_ADDR"
    # git
    git config --global http.proxy "$HTTP_ADDR"
    git config --global https.proxy "$HTTP_ADDR"
    # npm
    npm config set proxy "$HTTP_ADDR" 
    npm config set https-proxy "$HTTP_ADDR" 
    npm config set registry http://registry.npmjs.org/
    npm config set strict-ssl false

    # declare
    echo "current proxy status: using $PROXY_ADDR, proxying"
    ip
}

function unproxy() {
    unset all_proxy
    unset http_proxy
    unset https_proxy
    unset ALL_PROXY
    unset HTTP_PROXY
    unset HTTPS_PROXY
    # git
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    # npm
     npm config delete proxy
     npm config delete https-proxy
     npm config delete registry
     npm config delete strict-ssl
    # declare
    echo "current proxy status:  direct connect, not proxying"
    ip
}

function proxynpm() {
    # npm
    npm config set proxy "$HTTP_ADDR" 
    npm config set https-proxy "$HTTP_ADDR" 
    npm config set registry http://registry.npmjs.org/
    npm config set strict-ssl false

    # declare
    echo "current proxy status: using $PROXY_ADDR, proxying"
    ip
}


function unproxynpm() {
    # npm
     npm config delete proxy
     npm config delete https-proxy
     npm config delete registry
     npm config delete strict-ssl
    # declare
    echo "current proxy status:  direct connect, not proxying"
    ip
}

# compass --------------------------------------------------
alias cx="compass"
alias cw="compass workspace"
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/compass compass


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# python 
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# golang
export GOPATH=$HOME/golang
# export GOROOT="$(brew --prefix golang)/libexec"
export GOROOT=/opt/homebrew/opt/go@1.17/libexec

export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="/opt/homebrew/opt/go@1.17/bin:$PATH"

export PNPM_HOME="/Users/nn/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"


# my google zx shell scripts
export ZX_HOME=$HOME/.zx
export PATH="$ZX_HOME:$PATH"
