{
  config,
  pkgs,
  ...
}: {
  programs.nixvim.plugins.conform-nvim = {
    enable = true;

    settings = {
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };

      formatters_by_ft = {
        lua = ["stylua"];
        python = ["black" "isort"];
        rust = ["rustfmt"];
        nix = ["alejandra"];
        sql = ["sqlfluff"];
        json = ["prettier"];
        yaml = ["prettier"];
        markdown = ["prettier"];
        html = ["prettier"];
        css = ["prettier"];
        javascript = ["prettier"];
        typescript = ["prettier"];
        java = ["google-java-format"];
        go = ["goimports" "gofmt"];
      };

      formatters = {
        prettier = {
          command = "${pkgs.prettier}/bin/prettier";
          prepend_args = ["--use-tabs" "--single-quote"];
        };
        black = {
          command = "${pkgs.black}/bin/black";
          prepend_args = ["--line-length" "88"];
        };
        stylua = {
          command = "${pkgs.stylua}/bin/stylua";
          prepend_args = ["--indent-type" "Tabs" "--indent-width" "1"];
        };
        isort = {
          command = "${pkgs.python3Packages.isort}/bin/isort";
        };
        sqlfluff = {
          command = "${pkgs.sqlfluff}/bin/sqlfluff";
        };
        google-java-format = {
          command = "${pkgs.google-java-format}/bin/google-java-format";
        };
        rustfmt = {
          command = "${pkgs.rustfmt}/bin/rustfmt";
        };
        alejandra = {
          command = "${pkgs.alejandra}/bin/alejandra";
        };
        goimports = {
          command = "${pkgs.gotools}/bin/goimports";
        };
        gofmt = {
          command = "${pkgs.go}/bin/gofmt";
        };
      };
    };
  };
}
