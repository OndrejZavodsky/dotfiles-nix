{ config, pkgs, ... }: 

{
home.packages = with pkgs; [
	ripgrep
	fd
 	 black
	 stylua
	 isort
	 sqlfluff
	 prettier
	 lombok
	pyright
	vimPlugins.nvim-java-test
	wl-clipboard
];
home.file.".config/nvim".source = ./.dotfiles/.config/nvim;
programs.neovim = {
		enable = true;
		extraPackages = with pkgs; [
			gcc
			gnumake
			unzip
		];
	};

}
