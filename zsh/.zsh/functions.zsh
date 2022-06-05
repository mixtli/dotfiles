function generate_tags() {
	ripper-tags -R -e
}

es() {
    tmux split-window -v nvim "$@"
}


ktail() {
    kubetail $1 -e regex
}
