# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=10000

setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


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

export PS1='%F{blue}[%F{cyan}%n%F{green}@%F{magenta}%m%F{yellow} %~%F{blue}]$%F{reset_color%} '
export PATH="/usr/lib/ccache/bin:${HOME}/bin:${PATH}"
export EDITOR=nvim
export VISUAL=nvim

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue,bold"

# Bind keys for colemak-dhm
bindkey -M vicmd f vi-forward-word-end
bindkey -M vicmd p vi-replace-chars
bindkey -M vicmd b vi-find-next-char-skip
bindkey -M vicmd j vi-yank
bindkey -M vicmd l undo
bindkey -M vicmd u vi-insert
bindkey -M vicmd y vi-open-line-below
bindkey -M vicmd ";" vi-put-after
bindkey -M vicmd r vi-substitute
bindkey -M vicmd s vi-delete
bindkey -M vicmd t vi-find-next-char
bindkey -M vicmd m backward-char
bindkey -M vicmd n down-line-or-history
bindkey -M vicmd e up-line-or-history
bindkey -M vicmd i forward-char
bindkey -M vicmd o vi-repeat-find
bindkey -M vicmd d visual-mode
bindkey -M vicmd v vi-backward-word
bindkey -M vicmd k vi-repeat-search
bindkey -M vicmd h vi-set-mark

# change cursor shape for different vi mode
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ ${KEYMAP} = 'line' ]]; then
		echo -ne '\e[5 q'
	fi
}

function zle-line-init {
	zle -K viins
	echo -ne '\e[5 q'
}

zle -N zle-keymap-select
zle -N zle-line-init

# auto/tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # include hidden files

# use vim keys in tab completion menu
bindkey -M menuselect m vi-backward-char
bindkey -M menuselect n vi-down-line-or-history
bindkey -M menuselect e vi-up-line-or-history
bindkey -M menuselect i vi-forward-char
bindkey -v '^?' backward-delete-char

source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
source ~/.config/broot/launcher/bash/br
source ~/src/dotfiles/subprojects/zsh-autosuggestions/zsh-autosuggestions.zsh

