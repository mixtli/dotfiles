#!/usr/bin/env zsh
function tabname {
	if [ -z $TMUX ] ; then
		printf "\e]1;$@\a"
	else
		tmux rename-window "$@"
	fi
}

setTerminalText () {
	#works in bash & zsh
	local mode=$1 ; shift
	echo -ne "\033]$mode;$@\007"
}

stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }
function set-title(){
	TITLE="\[\e]2;$*\a\]"
	echo -e ${TITLE}
}
