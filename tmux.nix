{ config, pkgs, ...}: 

{
	programs.tmux = {
	  enable = true;
	  extraConfig = builtins.readFile ./.dotfiles/.config/tmux/tmux.conf;
	};


}
