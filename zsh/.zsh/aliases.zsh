alias dct="docker-compose -f docker-compose-test.yml"
alias dc="docker-compose"
alias tmux="tmux -2"
alias e="emacsclient -c"
alias ds="devspace"
alias gpu='[[ -z $(git config "branch.$(git symbolic-ref --short HEAD).merge") ]] && 
           git push -u origin $(git symbolic-ref --short HEAD) || 
           git push'

alias slack="slack-term -config ~/.config/slack-term/config"

