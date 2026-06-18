{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      nvim-autopairs.enable = true;
      nvim-surround.enable = true;
      comment.enable = true;
      which-key.enable = true;
      oil = {
        enable = true;
        settings = {
          default_file_explorer = true;
          view_options.show_hidden = true;
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "-";
        action = "<CMD>Oil<CR>";
        options = { desc = "Open parent directory"; };
      }
    ];
  };
}
