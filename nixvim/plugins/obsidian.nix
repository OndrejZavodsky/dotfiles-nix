{
  config,
  pkgs,
  ...
}: {
  programs.nixvim.opts.conceallevel = 1;
  programs.nixvim.extraConfigLua = ''
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.name == "obsidian-ls" then
          -- Force completion to trigger for these characters
          client.server_capabilities.completionProvider.triggerCharacters = { "[", "/", "#" }
        end
      end,
    })
  '';
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
      legacy_commands = false;
      workspaces = [
        {
          name = "personal";
          path = "~/Notes/personal";
        }
        {
          name = "work_and_school";
          path = "~/Notes/work_and_school";
        }
      ];

      completion = {
        min_chars = 1;
      };
    };
  };
}
