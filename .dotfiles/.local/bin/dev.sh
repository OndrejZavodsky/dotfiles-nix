#!/usr/bin/env bash
set -euo pipefail
if [ $# -ne 1 ]; then
    echo "Usage: dev.sh <file>"
    exit 1
fi
FILE="$(realpath "$1")"
if [ ! -f "$FILE" ]; then
    echo "Not a file: $FILE"
    exit 1
fi
PROJECT_DIR="$(dirname "$FILE")"
FILENAME="$(basename "$FILE")"
DIR_NAME="$(basename "$PROJECT_DIR")"
EXTENSION="${FILE##*.}"
HASH="$(printf '%s' "$PROJECT_DIR" | sha1sum | cut -c1-6)"
SESSION="dev-${DIR_NAME}-${HASH}"

case "$EXTENSION" in
    java)   CMD="nix develop ~/dotfiles-nix#java" ;;
    rs)     CMD="nix develop ~/dotfiles-nix#rust" ;;
    py)     CMD="nix develop ~/dotfiles-nix#python" ;;
    *)      CMD="$SHELL" ;;
esac

if tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux select-window -t "$SESSION:editor" 2>/dev/null || true
    tmux send-keys -t "$SESSION:editor" ":e $FILENAME" C-m
    tmux attach -t "$SESSION"
    exit 0
fi

tmux new-session -d -s "$SESSION" -n editor -c "$PROJECT_DIR" "$CMD"
tmux send-keys -t "$SESSION:editor" "nvim $FILENAME" C-m

tmux new-window -t "$SESSION" -n terminal -c "$PROJECT_DIR" "$CMD"
tmux attach -t "$SESSION"
