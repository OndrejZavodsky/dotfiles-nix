{ pkgs, config, ... }: {


	programs.bash = {
  enable = true;

  initExtra = ''
    export PATH="$HOME/.local/bin:$PATH"
	 dev() {
        local file
        file="$(fd . "$HOME" --type f --hidden --exclude .git | fzf)"
        [ -n "$file" ] && dev.sh "$file"
    }

    s() {
        if [ $# -eq 0 ]; then
            echo "Please provide a search term."
            return 1
        fi
        local query=$(echo "$*" | tr ' ' '+')
        w3m "https://search.brave.com/search?q=$query"
    }
    bind -x '"\C-f":dev'
  '';
  profileExtra = ''
  [[ -f ~/.bashrc ]] && source ~/.bashrc
'';

};

home.sessionPath = [
  "${config.home.homeDirectory}/.local/bin"
];
}
