{ config, pkgs, ... }:

{
  programs.nixvim = {
    autoCmd = [
      {
        event = "SwapExists";
        callback = {
          __raw = "function() vim.v.swapchoice = 'e' end";
        };
      }
      
      {
        event = "TextYankPost";
        callback = {
          __raw = "function() vim.highlight.on_yank() end";
        };
      }
    ];
  };
}
