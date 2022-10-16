#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -l --color=auto'
alias cd='cd -P'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias keys='grep bindsym ~/.config/sway/config | sed -e "s,^\s*bindsym \(.*\),\1,"'
alias cp='cp --reflink=auto'

export CCACHE_PREFIX="distcc"
export CCACHE_BASEDIR="${HOME}/src"
export CCACHE_SLOPPINESS="include_file_mtime"
export DISTCC_HOSTS="localhost"

export PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
export PATH="/usr/lib/ccache/bin:${HOME}/bin:${PATH}"
export EDITOR=nvim
export VISUAL=nvim

set -o vi


source ~/.config/broot/launcher/bash/br
