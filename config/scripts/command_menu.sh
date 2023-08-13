#!/usr/bin/env bash

exec &> >(tee -a /tmp/tmux.log)
exec 2>&1


if ! tmux list-sessions | grep tools
then
  TMUX='' tmux new-session -d -s tools
fi

session_name=$(tmux display-message -p "#S")
window_name=$(tmux display-message -p "#W")
if [ "$session_name" = "tools" ];
then
  tmux detach-client -s tools -P
fi

COMMAND_LINE=$(cat ~/.config/tmux/commands.txt | tr ',' '\t' |fzf --with-nth=1 )

WINDOW=$(echo "$COMMAND_LINE" | cut -d$'\t' -f1)
COMMAND=$(echo "$COMMAND_LINE" | cut -d$'\t' -f2)

tmux list-windows -t tools | grep $WINDOW
if [ $? -eq 0 ]; then
  tmux select-window -t "tools:${WINDOW}"
else
  tmux new-window -t tools -n $WINDOW "$COMMAND"
fi

TMUX='' tmux attach -t tools
