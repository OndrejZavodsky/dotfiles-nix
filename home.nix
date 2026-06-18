{ config, pkgs, inputs, ... }:

{
  imports = [
    ./git.nix
    ./tmux.nix
    ./theme-utils.nix
    ./shell.nix
    ./game.nix
    inputs.nixvim.homeModules.nixvim  
    ./nixvim/nixvim.nix
  ];

  home.username = "ondrejz";
  home.homeDirectory = "/home/ondrejz";
  home.stateVersion = "26.05";

  home.sessionVariables = {
    TERMINAL = "ghostty";
  };

  modules.game.enable = true;

  programs.git.enable = true;
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

  programs.rofi = {
    enable = true;
    theme = ./.dotfiles/themes/theme.rasi;
  };
}
