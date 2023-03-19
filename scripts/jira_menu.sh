#!/usr/bin/env bash

#exec &> >(tee -a /tmp/tmux.log)
#exec 2>&1

FILE="$(cat ~/.config/.jira/tmux.txt | tr '|' '\t')"
COMMAND_LINE=$(echo "$FILE" |fzf --with-nth=1 -d'\t')
WINDOW=$(echo "$COMMAND_LINE" | cut -d$'\t' -f1)
COMMAND=$(echo "$COMMAND_LINE" | cut -d$'\t' -f2)

#echo "$FILE"
#echo "$COMMAND_LINE"
#echo "$WINDOW"
#echo "$COMMAND"

FULL_COMMAND="$COMMAND --columns key,assignee,status,summary"
echo "$FULL_COMMAND"

eval $FULL_COMMAND
