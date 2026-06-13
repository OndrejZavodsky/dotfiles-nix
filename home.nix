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
	};
	home.file.".config/waybar".source = ./.dotfiles/.config/waybar;
	home.file.".config/ghostty".source = ./.dotfiles/.config/ghostty;
	home.file.".config/aerc".source = ./.dotfiles/.config/aerc;
	home.file.".config/tmux".source = ./.dotfiles/.config/tmux;
	home.file.".config/hypr".source = ./.dotfiles/.config/hypr;
	home.file."wallpapers".source = ./.dotfiles/wallpapers;
	home.pointerCursor = {
  gtk.enable = true;
  package = pkgs.vanilla-dmz;
  name = "Vanilla-DMZ";
  size = 24;
};
}
