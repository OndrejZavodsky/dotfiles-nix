{
  config,
  pkgs,
  ...
}: {
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        lua
        rust
        python
        sql
        java
        nix
        go
        gomod
        gowork
      ];

      settings = {
        ensure_installed = [];

        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };

        indent = {
          enable = true;
        };
      };
    };

    treesitter-textobjects = {
      enable = true;
    };
  };
}
