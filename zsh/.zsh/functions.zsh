function generate_tags() {
	ripper-tags -R -e
}

es() {
    tmux split-window -v nvim "$@"
}

function ghpr() {
  GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
}

function incr() {
  if [ -z "$1" ];
    then
  awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{$NF=sprintf("%0*d", length($NF), ($NF+1)); print}'
  else
    echo $1 | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{$NF=sprintf("%0*d", length($NF), ($NF+1)); print}'
  fi

}
