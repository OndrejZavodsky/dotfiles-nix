{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      servers = {
        nixd.enable = true;

        pyright.enable = true;

        clangd.enable = true;

        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };

        html.enable = true;
        cssls.enable = true;
        jsonls.enable = true;

        jdtls.enable = true;
      };

      keymaps = {
        silent = true;
        diagnostic = {
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };
        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gi" = "implementation";
          "gt" = "type_definition";
          "K" = "hover";
          "<leader>cr" = "rename";
          "<leader>ca" = "code_action";
          "gr" = "references";
        };
      };
    };
  };
}
