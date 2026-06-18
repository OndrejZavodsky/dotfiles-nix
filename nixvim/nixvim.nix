{ config, pkgs, ... }:

{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./autoCmd.nix

    ./plugins/lsp.nix
    ./plugins/autoCompleat.nix
    ./plugins/formaters.nix

    ./plugins/treeSitter.nix
    ./plugins/telescope.nix
    ./plugins/harpoon.nix

    ./plugins/refactoring.nix
    ./plugins/dap.nix
    ./plugins/git.nix

    ./plugins/sql.nix
    ./plugins/obsidian.nix

    ./plugins/collor.nix
    ./plugins/qol.nix
  ];

  programs.nixvim = {
    enable = true;
	 nixpkgs.pkgs = pkgs;
    globals.mapleader = " ";
  };
}
