#!/usr/bin/env bash

COMMANDS=$(cat <<-END
  lazydocker
  k9s
  htop
  lazygit
  spotify
END
)


export COMMAND=$(echo -n "$COMMANDS" | fzf)

#$COMMAND
echo "here"
echo $COMMAND

tmux list-sessions
TMUX='' tmux new-session -d -A -s scratch
tmux list-sessions

tmux select-window -t "scratch:$COMMAND"
if [ $? -eq 0 ]; then
  echo "attaching"
else
  echo "new-window"
  tmux new-window -n $COMMAND $COMMAND
  echo "done new-window"
fi
