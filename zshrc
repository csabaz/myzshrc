# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _list _expand _complete _ignored _match _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle :compinstall filename '$HOME/.zshrc'


# End of lines added by compinstall

# Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"
##debian proxmox
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## ubuntu(?)
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## opensuse git
source $HOME/.oh-my-zsh/custom/plugins/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ -n $SSH_CONNECTION ]]; then
  ZSH_THEME="agnostercustom"
else
  ZSH_THEME="agnoster"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
#  colored-man-page
#  colorize
  command-not-found
  dirpersist
  debian
  systemd
  history
  docker
  salt
  zsh-navigation-tools
  zsh-autosuggestions
  zsh-completions
  tmux
)

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
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias sudo='sudo '
alias vi="nvim"
which kubectl &>/dev/null
if [[ $? -eq 0 ]]; then
        source <(kubectl completion zsh) && echo "exists 'kubectl'"
else
	echo "!exists 'kubectl'"
fi
which helm &>/dev/null
if [[ $? -eq 0 ]]; then                       
        source <(helm completion zsh) && echo "exists 'helm'"
else    
        echo "!exists 'helm'"
fi

alias vi="nvim"
alias k=kubectl
alias h=helm
complete -F __start_kubectl k
complete -F __start_helm h
export KUBECONFIG=~/.kube/config
#alias spc="spacecmd -q"
alias z='zypper'
alias s='sudo'
alias sctl='systemctl'
#alias ccat="pygmentize -g"
#alias xtigervncviewer="vncviewer-tigervnc"
#autoload -Uz compinit
#compinit
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-${HOME}}/$ZSH_COMPDUMP(#qN.mh+24) ]]; then
compinit -d $ZSH_COMPDUMP;
else
compinit -C;
fi;
compinit

# Folder history
zle -N znt-cd-widget
bindkey "^P" znt-cd-widget

# ctrl-u - delete befor cursor
bindkey "^U" backward-kill-line


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi


# Powerline
#powerline-daemon -q
#source /usr/share/powerline/bindings/zsh/powerline.zsh
#neofetch

#source /home/csabaz/.config/broot/launcher/bash/br
#function ssh () {/usr/bin/ssh -t $@ "tmux attach || tmux new";}
#xrdb ~/.Xresources

##GAM
#function gam() { "/home/cremenar/bin/gam/gam" "$@" ; }
#function gam() { "$HOME/bin/gamadv-xtd3/gam" "$@" ; }
#export GAMCFGDIR="$HOME/.gam"
#alias gam="$HOME/bin/gamadv-xtd3/gam"
#alias gam="/home/cremenar/bin/gamadv-xtd3/gam"
#alias column="$HOME/bin/column"

export EDITOR=/usr/bin/nvim
export VISUAL=$EDITOR
export SELECTED_EDITOR=$EDITOR

if [[ -f ~/.profile ]]; then
	source ~/.profile && echo "exists '.profile'"
else
        echo "!exists '.profile'"
fi

if [[ -f ~/.customrc ]]; then
	source ~/.customrc && echo "exists '.customrc'"
else
        echo "!exists '.customrc'"
fi
# ---

## Oh my zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## required plugins/apps
# git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-users/zsh-syntax-highlighting
# themes
# tmux
# yum # for centOS
# apt install ruby-albino #for colorize
# apt install powerline fonts-powerline psutils
# mkdir -p ~/.config/powerline/themes/shell
# vi ~/.config/powerline/themes/shell/default.json

## symlinks
# ln -sf ~/myzshrc/zshrc ~/.zshrc
# ln -sf ~/myzshrc/themes/agnostercustom.zsh-theme ~/.oh-my-zsh/themes/
