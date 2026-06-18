{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
    refactoring = {
      enable = true;
    };

    "inc-rename" = {
      enable = true;
      settings = {
      };
    };
  };
}
