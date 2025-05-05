# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export LANG="en_US.UTF-8"
export LC_TYPE="en_US.UTF-8"
export LC_ALL="C.UTF-8"
export rm="rm -i"
export mv="mv -i"
export cp="cp -i"
export GOPATH="/home/jnancel/go"
export SHELL="/bin/bash"

# Useful
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias cat="ccat"

# Gros doigts
alias grpe="grep"
alias grpep="grep"
alias gerp="grep"
alias gpre="grep"
alias vmi="vim"
alias ivm="vim"
alias shs="ssh"
alias pign="ping"
alias bim="vim"
alias im="vim"
alias tailf="tail -f"

# Git aliases
alias gs="git status"
alias gco="git checkout"
alias ga="git add"
alias gc="git commit"
alias gcs="git commit -S"
alias gd="git diff"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gb="git branch"
alias gl="git log"
alias glp="git log --pretty=oneline"

# SSO
alias ssologin="aws sso login --profile qa-fulladmin"

# Network
alias myip="curl ifconfig.me"

# Terraform
alias tf="terraform"
export AWS_VAULT_BACKEND=file

# pproxy
alias pprox="pproxy -r socks5://127.0.0.1:3000 --daemon"

# AWS
euw1="--region eu-west-1"
euw3="--region eu-west-3"
eus1="--region eu-south-1"
use1="--region us-east-1"
fa="fulladmin"
complete -C '/usr/local/bin/aws_completer' aws

# k8s
alias kctl="kubectl"
alias kcost="kubectl-cost"

#export LANG="fr_FR.ISO-8859"

export PATH="$PATH:$HOME/.tfenv/bin:$HOME/.local/bin:/usr/local/go/bin"
export PATH=$PATH:/home/jnancel/bin:/home/jnancel/go/bin:/home/jnancel/Perso/Git/home/bin
export LESSCHARSET=utf-8
source <(awless completion bash)

#function prox_socks() {
#  ssh -fN -D3000 -o ServerAliveInterval=20 bastion-nonprod-euw1
#  pprox
#  #export http_proxy=$prox
#  #export https_proxy=$prox
#  #export HTTP_PROXY=$prox
#  #export HTTPS_PROXY=$prox
#  #export SOCKS_PROXY=$prox
#}
#
#function prox_zscaler() {
#  #prox="http://127.0.0.1:9000"
#  export http_proxy="http://127.0.0.1:9000"
#  export https_proxy="http://127.0.0.1:9000"
#  export HTTP_PROXY="http://127.0.0.1:9000"
#  export HTTPS_PROXY="http://127.0.0.1:9000"
#}
#
#function unset_prox() {
#  unset http_proxy
#  unset https_proxy
#  unset HTTP_PROXY
#  unset HTTPS_PROXY
#}
#
##prox="http://127.0.0.1:9000"
#pproxy_prox="http://127.0.0.1:8080"
#socks_prox="socks5://127.0.0.1:3000"
##export http_proxy=http://127.0.0.1:3128/
##export https_proxy=http://127.0.0.1:3128/
##export http_proxy=http://172.23.224.1:9000/
##export https_proxy=http://172.23.224.1:9000/
##export HTTP_PROXY=http://172.23.224.1:9000/
##export HTTPS_PROXY=http://172.23.224.1:9000/
##export http_proxy=http://127.0.0.1:9000
##export https_proxy=http://127.0.0.1:9000/
##export HTTP_PROXY=http://127.0.0.1:9000/
##export HTTPS_PROXY=http://127.0.0.1:9000/
#export http_proxy=$pproxy_prox
#export https_proxy=$pproxy_prox
#export HTTP_PROXY=$pproxy_prox
#export HTTPS_PROXY=$pproxy_prox
#export SOCKS_PROXY=$socks_prox
##export AZ_REQUESTS_CA_BUNDLE=/opt/az/lib/python3.10/site-packages/certifi/cacert.pem
##export AWS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
##export http_proxy=http://127.0.0.1:9000/
##export https_proxy=http://127.0.0.1:9000/
#export no_proxy='.es.amazonaws.com,192.168.0.29,169.254.169.254'
##export no_proxy='.es.amazonaws.com,192.168.0.29'

function _update_ps1() {
    #PS1="$(~/go/bin/powerline-go -error $? -colorize-hostname -mode flat)"
    PS1="$(~/go/bin/powerline-go -error $? -colorize-hostname -cwd-max-depth 3)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export EDITOR=vim
export WIN_HOME="/mnt/c/Users/JNancel"
export WIN_DL="$WIN_HOME/Downloads"
#export REQUESTS_CA_BUNDLE=/etc/ssl/certs/Zscaler_cert.pem

mkdir -p ~/.screen && chmod 700 ~/.screen
export SCREENDIR=$HOME/.screen

# For WSL2 to be able to reach Internet
#wsl.exe -d wsl-vpnkit service wsl-vpnkit start
#wsl.exe -d wsl-vpnkit-0.4.1 --cd /app wsl-vpnkit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
complete -o default -F __start_kubectl kctl
