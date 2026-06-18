{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      vim-dadbod.enable = true;
      vim-dadbod-completion.enable = true;
      vim-dadbod-ui.enable = true;
    };

    globals = {
      db_ui_use_nerd_fonts = 1;
    };
  };
}
