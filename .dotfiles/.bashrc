# Scripts
export PATH="$HOME/.local/bin:$PATH"

# Cargo
. "$HOME/.cargo/env"

# Composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Dev file finder - Ctrl+F
dev() {
    local file
    file="$(fd . "$HOME" --type f --hidden --exclude .git | fzf)"
    [ -n "$file" ] && dev.sh "$file"
}
bind -x '"\C-f":dev'

# Brave search in w3m
s() {
    if [ $# -eq 0 ]; then
        echo "Please provide a search term."
        return 1
    fi
    local query=$(echo "$*" | tr ' ' '+')
    w3m "https://search.brave.com/search?q=$query"
}
