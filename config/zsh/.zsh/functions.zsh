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

function fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -o pid,ppid,%cpu,%mem,command -r -u $UID  | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}
