{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      
      settings = {
        ensure_installed = [ 
          "lua" 
          "rust" 
          "python" 
          "sql" 
          "java" 
          "nix"
        ];
        
        highlight.enable = true;
        indent.enable = true;
      };
    };

    treesitter-textobjects = {
      enable = true;
    };
  };
}
