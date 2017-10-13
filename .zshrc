
#source ~/.zshenv
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"


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
plugins=(git colored-man colorize virtualenv pip python brew osx zsh-syntax-highlighting common-aliases zsh-history-substring-search jsontools)

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }


# Set emacs keybindings for history substring not working
# Would be really nice if this worked
#bindkey -M emacs '^P' history-substring-search-up
#bindkey -M emacs '^N' history-substring-search-down


#Script to check for git versions
function check {
    count=0

    if [ "$2" = "" ]; then
        echo "########################### Checkins ###########################"
        for item in $(git log --pretty=%H --grep $1); do
            git --no-pager show -s --pretty="%h %cn, %s - %ar" $item
        done

        echo ""
        echo "########################### Files ###########################"
        for item in $(git log --pretty=%h --grep $1); do
            for file in $(git diff-tree --no-commit-id --name-only -r $item); do
                count=$(($count + 1))
                echo -e "$item $count\t$file"
            done
        done
    else
        ########################### Diff ###########################
        for item in $(git log --pretty=%H --grep $1); do
            for file in $(git diff-tree --no-commit-id --name-only -r $item); do
                count=$(($count + 1))
                if [ "$count" = "$2" ]; then
                    git --no-pager show $item $file
                fi
            done
        done
    fi
}



#############
# Aliases
#############

alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias roulette='if [[ $[ $RANDOM % 6 ] == 0 ]]; then echo "boom"; else echo "click"; fi'

# Docker
alias kill-docker='docker stop `docker ps -q`'
# brew install docker-clean
alias dockerc='docker-clean --all'

# Project search
alias pgrep='grep -R -i --color --exclude-dir={node_modules,bower_components,./public,lib,.git,build,docs} --exclude={yarn.lock,.gitignore} '

alias response-headers='curl -s -D - -o /dev/null'
alias headers-http2='curl --http2 -s -D - -o /dev/null'

# ###########
# All exports
# ###########

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="pygamalion"
ZSH_THEME="robbyrussell"

# Path to your oh-my-zsh installation.
export ZSH=/Users/robin.abrahamsson/.oh-my-zsh

# Source zsh
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# NEED TO BE FIRST, does not add to path, sets PATH
export PATH="/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export ALTERNATE_EDITOR=emacs EDITOR=emacsclient VISUAL=emacsclient
# export EDITOR='emacs'

# Add latex to path
export PATH=${PATH}:/usr/local/texlive/2016/bin/x86_64-darwin

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#Add missing color
export TERM=xterm-256color

# Add android stuff to path
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools

# Rearrange so brew path is ok
export PATH="/usr/local/bin:$PATH"


#Configure yarn and npm paths
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$PATH:/usr/local/bin/yarn"
alias npm-exec='PATH=$(npm bin):$PATH'
export PATH=./node_modules/.bin:$PATH

export NVM_DIR="/Users/robin.abrahamsson/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.elmenv/bin:$PATH"
eval "$(elmenv init -)"

source ~/.profile #Loading profile beacuse rvm is loaded there

#Set locale
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

#Configure Leiningen for Clojure
export PATH=~/bin:$PATH

# #Configure Rust
source $HOME/.cargo/env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/robin.abrahamsson/.sdkman"
[[ -s "/Users/robin.abrahamsson/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/robin.abrahamsson/.sdkman/bin/sdkman-init.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
