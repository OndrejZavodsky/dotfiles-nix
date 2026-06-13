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
HASH="$(printf '%s' "$PROJECT_DIR" | sha1sum | cut -c1-6)"
SESSION="dev-${DIR_NAME}-${HASH}"
# Attach if session exists
if tmux has-session -t "$SESSION" 2>/dev/null; then
    tmux select-window -t "$SESSION:editor" 2>/dev/null || true
    tmux send-keys -t "$SESSION:editor" ":e $FILENAME" C-m
    tmux attach -t "$SESSION"
    exit 0
fi
# Create session
tmux new-session -d -s "$SESSION" -n editor -c "$PROJECT_DIR"
tmux send-keys -t "$SESSION:editor" "nvim \"$FILENAME\"" C-m
# Tools window
tmux new-window -t "$SESSION" -n terminal -c "$PROJECT_DIR"
tmux new-window -t "$SESSION" -n agents -c "$PROJECT_DIR"
tmux send-keys -t "$SESSION:agents" "opencode ." C-m
tmux attach -t "$SESSION"

