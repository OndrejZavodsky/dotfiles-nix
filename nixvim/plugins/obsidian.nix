{
  config,
  pkgs,
  ...
}: {
  programs.nixvim.opts.conceallevel = 1;
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
