# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="pygamalion"
ZSH_THEME="robbyrussell"

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
plugins=(git colored-man colorize virtualenv pip python brew osx zsh-syntax-highlighting common-aliases zsh-history-substring-search jsontools)

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias roulette='if [[ $[ $RANDOM % 6 ] == 0 ]]; then echo "boom"; else echo "click"; fi'

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

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

#Configure Rust
source $HOME/.cargo/env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/robin.abrahamsson/.sdkman"
[[ -s "/Users/robin.abrahamsson/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/robin.abrahamsson/.sdkman/bin/sdkman-init.sh"
