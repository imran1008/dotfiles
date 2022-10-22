#
# ~/.config/fish/config.fish
#

function fish_mode_prompt --description 'Displays the current mode'
   # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold --background red white
                echo '[N]'
            case insert
                set_color --bold --background green black
                echo '[I]'
            case replace_one
                set_color --bold --background green black
                echo '[R]'
            case replace
                set_color --bold --background cyan black
                echo '[R]'
            case visual
                set_color --bold --background magenta black
                echo '[V]'
        end
        set_color normal
        echo -n ' '
    end
end

alias ls='ls --color=auto'
alias l='ls -l --color=auto'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias mutt='neomutt'
alias keys='grep bindsym ~/.config/sway/config | sed -e "s,^\s*bindsym \(.*\),\1,"'
alias cp='cp --reflink=auto'
alias admin='sudo -u admin --'
alias paru='admin paru'

alias lman='man 3'  # Linux man pages
alias pman='man 1p' # POSIX man pages

export CCACHE_PREFIX="distcc"
export CCACHE_BASEDIR="$HOME/src"
export CCACHE_SLOPPINESS="include_file_mtime"
export DISTCC_HOSTS="localhost"

export PATH="/usr/lib/ccache/bin:$HOME/bin:$HOME/src/depot_tools:$PATH"
export EDITOR=nvim
export VISUAL=nvim
export READER=zathura
export TERMINAL=alacritty
export BROWSER=firefox
export COLORTERM=truecolor
export PAGER=less
export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1

# Powerline
set -g theme_display_git no
set -g theme_display_git_dirty no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_git_worktree_support yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_vagrant no
set -g theme_display_docker_machine no
set -g theme_display_k8s_context no
set -g theme_display_hg no
set -g theme_display_virtualenv no
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_nvm no
set -g theme_display_user ssh
set -g theme_display_hostname yes   # default: ssh
set -g theme_display_vi yes
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process no
set -g theme_title_display_path no
set -g theme_title_display_user no
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone America/New_York
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user imran  # default: your_default_user
set -g theme_color_scheme dracula
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor no
set -g theme_newline_prompt '$ '

if test "$fish_key_bindings" = "fish_vi_key_bindings"
# Remapping keys for colemak dhm
	bind --user -M insert o self-insert expand-abbr
	bind --user m backward-char
	bind --user i forward-char
	bind --user -m insert y insert-line-under repaint-mode
	bind --user -m insert Y insert-line-over repaint-mode
	bind --user -m insert u repaint-mode
	bind --user -m insert U beginning-of-line repaint-mode
	bind --user -m visual d begin-selection repaint-mode
	bind --user l undo
	bind --user e up-or-search
	bind --user n down-or-search
	bind --user v backward-word
	bind --user V backward-bigword
	bind --user f forward-single-char forward-word backward-char
	bind --user F forward-bigword backward-char
	bind --user s kill-line
	bind --user -m insert r delete-char repaint-mode
	bind --user -m insert R kill-whole-line repaint-mode
	bind --user N end-of-line delete-char
	bind --user E man\ \(commandline\ -t\)\ 2\>/dev/null\;\ or\ echo\ -n\ \\a
	bind --user J kill-whole-line yank
	bind --user t forward-jump
	bind --user T backward-jump
	bind --user b forward-jump-till
	bind --user B backward-jump-till
	bind --user o repeat-jump
	bind --user ';' forward-char yank
	bind --user ':' yank
	bind --user -m replace_one p repaint-mode
	bind --user -m replace P repaint-mode
	bind --user -M visual m backward-char
	bind --user -M visual i forward-char
	bind --user -M visual e up-line
	bind --user -M visual n down-line
	bind --user -M visual v backward-word
	bind --user -M visual V backward-bigword
	bind --user -M visual f forward-word
	bind --user -M visual F forward-bigword
	bind --user -M visual y swap-selection-start-stop repaint-mode
	bind --user -M visual t forward-jump
	bind --user -M visual b forward-jump-till
	bind --user -M visual T backward-jump
	bind --user -M visual B backward-jump-till
	bind --user -M visual -m insert r kill-selection end-selection repaint-mode
	bind --user -M visual -m default s kill-selection end-selection repaint-mode
	bind --user -M visual -m default j kill-selection yank end-selection repaint-mode
end


