alias dct="docker compose -f docker-compose-test.yml"
alias dc="docker compose"
alias tmux="tmux -2"
alias e="emacsclient -c"
alias ds="devspace"
alias gpu='[[ -z $(git config "branch.$(git symbolic-ref --short HEAD).merge") ]] && 
           git push -u origin $(git symbolic-ref --short HEAD) || 
           git push'

alias slack="slack-term -config ~/.config/slack-term/config"
alias k="kubectl"

# Git
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

# GH
alias gprs=gh search prs --state=open --review-requested=@me
