{ config, pkgs, ... }:

{
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
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
        min_chars = 2;
      };
    };
  };
}
