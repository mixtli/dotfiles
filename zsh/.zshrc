# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/rmcclain/.oh-my-zsh
unsetopt BEEP

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(alias-finder compleat colored-man-pages git git-prompt dash docker-compose z ruby pow fasd vi-mode tmux web-search osx jsontools httpie docker brew bundler fzf iterm2 jira ripgrep)
#plugins=(per_directory_history)
source $ZSH/oh-my-zsh.sh


source ~/.zsh/appen.zsh
source ~/.zsh/tmux.zsh
source ~/.zsh/ruby.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/fzf_git.sh
source ~/.zsh/mappings.zsh
source ~/.zsh/cursor.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/rmcclain/.sdkman"
#[[ -s "/Users/rmcclain/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/rmcclain/.sdkman/bin/sdkman-init.sh"


unsetopt no_share_history
setopt share_history
export EDITOR=nvim
export VISUAL=nvim


# Use vi input mode
bindkey -v

# This script provided by iTerm2 project: https://www.iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/src/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/src/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/src/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/src/google-cloud-sdk/completion.zsh.inc"; fi



TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

alias plantuml="java -jar ${HOME}/plantuml/plantuml.jar"
export HISTFILE=~/.zsh_history
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit bashcompinit 
compinit
bashcompinit
source ~/.bash_completion.d/compleat_setup

source /usr/local/share/zsh/site-functions

eval "$(fasd --init auto)"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias ms3="aws s3 --profile minio --endpoint-url http://files.rmcclain.engineering-devspace-sandbox.my.devspace.host"

eval "$(ssh-agent -s)"

source /Users/rmcclain/.zsh/crypto.env
export PATH=$PATH:/Users/rmcclain/Personal/bin

# Some crap on Catalina needed to get some things to compile
export SDKROOT=$(xcrun --show-sdk-path)
