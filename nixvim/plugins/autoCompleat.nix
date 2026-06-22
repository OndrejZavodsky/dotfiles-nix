{
  config,
  pkgs,
  ...
}: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-e>" = "cmp.mapping.abort()";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
        };

        sources = [
          {name = "obsidian";}
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "buffer";}
          {name = "path";}
          {name = "vim-dadbod-completion";}
        ];
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp_luasnip.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;

    luasnip.enable = true;
  };
}
