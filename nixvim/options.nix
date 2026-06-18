{ config, pkgs, ... }:

{
  programs.nixvim = {
    globals = {
      mapleader = " "; 
      lazyvim_picker = "telescope";
    };

    opts = {
      number = true;
      relativenumber = true;

      tabstop = 3;
      shiftwidth = 3;
      expandtab = false;

      guicursor = [
        "n-v-c:block"
        "i:block"
        "r-cr:block"
        "o:block"
      ];
    };
  };
}
