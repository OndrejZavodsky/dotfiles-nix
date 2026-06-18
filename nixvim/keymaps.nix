{ config, pkgs, helpers, ... }:

{
  programs.nixvim = {
    keymaps = [
      {
        mode = "i";
        key = "jk";
        action = "<Esc>";
        options.noremap = false;
      }
      {
        mode = "v";
        key = "<C-d>";
        action = "<C-d>zz";
        options.noremap = true;
      }
      {
        mode = "v";
        key = "<C-u>";
        action = "<C-u>zz";
        options.noremap = true;
      }

      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Find files";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Live grep";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
        options.desc = "Buffers";
      }
      {
        mode = "n";
        key = "<C-p>";
        action = "<cmd>Telescope git_files<cr>";
        options.desc = "Git files";
      }

      {
        mode = "n";
        key = "<leader>a";
        action = config.lib.nixvim.mkRaw "function() require('harpoon'):list():add() end";
        options.desc = "Harpoon add file";
      }
      {
        mode = "n";
        key = "<leader>h";
        action = config.lib.nixvim.mkRaw "function() local h = require('harpoon'); h.ui:toggle_quick_menu(h:list()) end";
        options.desc = "Harpoon menu";
      }
      {
        mode = "n";
        key = "<C-1>";
        action = config.lib.nixvim.mkRaw "function() require('harpoon'):list():select(1) end";
        options.desc = "Harpoon file 1";
      }
      {
        mode = "n";
        key = "<C-2>";
        action = config.lib.nixvim.mkRaw "function() require('harpoon'):list():select(2) end";
        options.desc = "Harpoon file 2";
      }
      {
        mode = "n";
        key = "<C-3>";
        action = config.lib.nixvim.mkRaw "function() require('harpoon'):list():select(3) end";
        options.desc = "Harpoon file 3";
      }
      {
        mode = "n";
        key = "<C-4>";
        action = config.lib.nixvim.mkRaw "function() require('harpoon'):list():select(4) end";
        options.desc = "Harpoon file 4";
      }

      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
        options.desc = "LazyGit";
      }
      {
        mode = "n";
        key = "]h";
        action = "<cmd>Gitsigns next_hunk<cr>";
        options.desc = "Next hunk";
      }
      {
        mode = "n";
        key = "[h";
        action = "<cmd>Gitsigns prev_hunk<cr>";
        options.desc = "Prev hunk";
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = "<cmd>Gitsigns stage_hunk<cr>";
        options.desc = "Stage hunk";
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = "<cmd>Gitsigns blame_line<cr>";
        options.desc = "Blame line";
      }

      {
        mode = [ "n" "x" ];
        key = "<leader>re";
        action = config.lib.nixvim.mkRaw "function() return require('refactoring').extract_func() end";
        options = { expr = true; desc = "Extract function"; };
      }
      {
        mode = [ "n" "x" ];
        key = "<leader>rv";
        action = config.lib.nixvim.mkRaw "function() return require('refactoring').extract_var() end";
        options = { expr = true; desc = "Extract variable"; };
      }
      {
        mode = [ "n" "x" ];
        key = "<leader>ri";
        action = config.lib.nixvim.mkRaw "function() return require('refactoring').inline_var() end";
        options = { expr = true; desc = "Inline variable"; };
      }

      {
        mode = "n";
        key = "<leader>db";
        action = config.lib.nixvim.mkRaw "function() require('dap').toggle_breakpoint() end";
        options.desc = "Toggle breakpoint";
      }
      {
        mode = "n";
        key = "<leader>dc";
        action = config.lib.nixvim.mkRaw "function() require('dap').continue() end";
        options.desc = "Continue";
      }
      {
        mode = "n";
        key = "<leader>di";
        action = config.lib.nixvim.mkRaw "function() require('dap').step_into() end";
        options.desc = "Step into";
      }
      {
        mode = "n";
        key = "<leader>do";
        action = config.lib.nixvim.mkRaw "function() require('dap').step_over() end";
        options.desc = "Step over";
      }
      {
        mode = "n";
        key = "<leader>du";
        action = config.lib.nixvim.mkRaw "function() require('dapui').toggle() end";
        options.desc = "Toggle DAP UI";
      }
    ];

    plugins.lsp.onAttach = ''
      vim.keymap.set("n", "<leader>rn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { buffer = true, expr = true, desc = "Rename" })
    '';
  };
}
