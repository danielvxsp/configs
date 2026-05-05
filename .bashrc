#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias n='nvim'
alias sn='sudo nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mus='mpv --no-audio-display'
alias x='startx'
alias mpd='mkdir -p /run/user/1000/mpd/ && mpd'
alias ddown='docker compose down'
alias dup='docker compose up -d'
alias danidub='ani-cli --dub -d --range "1 -1"'
alias dani='ani-cli -d --range "1 -1"'
alias untar='tar -xvf'

# zshrc or bashrc
lf () {
	LF_TEMPDIR="$(mktemp -d -t lf-tempdir-XXXXXX)"
	LF_TEMPDIR="$LF_TEMPDIR" lf-run -last-dir-path="$LF_TEMPDIR/lastdir" "$@"
	if [ "$(cat "$LF_TEMPDIR/cdtolastdir" 2>/dev/null)" = "1" ]; then
		cd "$(cat "$LF_TEMPDIR/lastdir")"
	fi
	rm -r "$LF_TEMPDIR"
	unset LF_TEMPDIR
}

PS1="\n\[\e[1;32m\] 7\ \[\e[0m\]\[\e[36m\]\w\[\e[0m\]\[\e[1;32m\] -> \[\e[0m\]"

export PROMPT_DIRTRIM=1
export _JAVA_AWT_WM_NONREPARENTING=1 #netbeans

# PATH's
export PATH="/usr/local/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=/home/ninog/.cargo/bin:$PATH
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:${XDG_DATA_DIRS:-}"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export XDG_CACHE_HOME="$HOME/.cache"
. "/home/ninog/.deno/env"


QT_QUICK_BACKEND=software
