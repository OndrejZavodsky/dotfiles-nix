{ config, pkgs, ... }:

{
  programs.nixvim = {
    colorschemes.rose-pine = {
      enable = true;
      settings = {
        variant = "main"; 
      };
    };

    colorscheme = "rose-pine";
  };
}
