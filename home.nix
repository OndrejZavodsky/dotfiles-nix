{ config, pkgs, ... }:

{

   imports = [
		./nvim.nix
		./git.nix
	];
	home.username = "ondrejz";
	home.homeDirectory = "/home/ondrejz";
	home.stateVersion = "26.05";

	home.sessionVariables = {
		TERMINAL = "ghostty";
	};
	programs.git.enable = true;
	programs.bash = {
  enable = true;

  initExtra = ''
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
};

home.sessionPath = [
  "$HOME/.local/bin"
];
	home.file.".config/waybar".source = ./.dotfiles/.config/waybar;
	home.file.".config/ghostty".source = ./.dotfiles/.config/ghostty;
	home.file.".config/tmux".source = ./.dotfiles/.config/tmux;
	home.file.".config/hypr".source = ./.dotfiles/.config/hypr;
	home.file."wallpapers".source = ./.dotfiles/wallpapers;
	home.file.".local/bin".source = ./.dotfiles/.local/bin;
	home.pointerCursor = {
  gtk.enable = true;
  package = pkgs.vanilla-dmz;
  name = "Vanilla-DMZ";
  size = 24;
};
}
