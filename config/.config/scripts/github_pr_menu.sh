#!/usr/bin/env bash

TYPES=$(cat <<END
mine
requested
END
);


echo $TYPES

TYPE=$(echo "$TYPES" | fzf)

case "$TYPE" in
  mine) QUERY="--author=@me --state=open"
  ;;
  requested) QUERY="--review-requested=@me --state=open" 
  ;;
  *) echo default
  ;;
esac

LINE=$(gh search prs $QUERY| fzf)

REPO=$(echo "$LINE" | cut -f1)
NUMBER=$(echo "$LINE" | cut -f2)

echo $REPO

URL="https://github.com/${REPO}/pull/${NUMBER}"

open $URL
