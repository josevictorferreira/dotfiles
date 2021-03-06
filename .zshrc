# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/josevictor/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="bullet-train"
ZSH_THEME="rainbow"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias freemem="sync; echo 2 | sudo tee /proc/sys/vm/drop_caches"
alias wspc="cd ~/Workspace"
alias docs="cd ~/Documentos"
alias todo="vi ~/Documentos/todo.wiki"

mon()
{
    xrandr --output eDP1 --brightness $1
}

hdmi()
{
    xrandr --output HDMI1 --brightness $1
}

gitpick_commit()
{
    git --git-dir=../../$1/.git format-patch -k -1 --stdout $2 | git am -3 -k --ignore-whitespace
}

gitpick_commit_noprevious()
{
    git --git-dir=../../$1/.git format-patch -k -1 --stdout $2 | git am --reject -k --ignore-whitespace
}

gitamendnow(){
    git commit --amend --date="$(date -R)" --author="José Victor <jose.victor@bistwobis.com.br>" --no-edit
}


report() {
    sudo vi var/report/$(ls -Art var/report | tail -n 1)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export MAIL=~/Maildir
export MAIL=~/Maildir

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/skim/skim/release
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:/home/josevictor/.asdf/installs/python/3.6.6/bin


export TERM=xterm-256color

export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'gedit'; else echo 'nvim'; fi)"

. $HOME/.asdf/asdf.sh
alias keybr='sudo setxkbmap -layout br'
alias keyus='sudo setxkbmap -layout us'

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
