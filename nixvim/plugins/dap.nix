{ config, pkgs, helpers, ... }:

{
  programs.nixvim.plugins = {
    dap = {
      enable = true;
      
      settings.listeners = {
        before = {
          attach = {
            dapui_config = helpers.mkRaw "function() require('dapui').open() end";
          };
          launch = {
            dapui_config = helpers.mkRaw "function() require('dapui').open() end";
          };
          event_terminated = {
            dapui_config = helpers.mkRaw "function() require('dapui').close() end";
          };
          event_exited = {
            dapui_config = helpers.mkRaw "function() require('dapui').close() end";
          };
        };
      };
    };

    dap-ui = {
      enable = true;
    };

    dap-virtual-text = {
      enable = true;
    };
  };
}
