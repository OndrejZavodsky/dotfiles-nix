{ config, pkgs, ... }:

{

home.packages = with pkgs; [
lazygit
];
  programs.git = {
    enable = true;

    settings.user.name = "Ondrej Zavodsky";
    settings.user.email = "zavodsky.ondrej1@gmail.com";

    ignores = [
      ".direnv"
      ".env"
      "node_modules"
      "result"
		"account.conf"
    ];
		
    settings = {
      init.defaultBranch = "main";

      pull.rebase = true;
      fetch.prune = true;

      core.editor = "nvim";

      diff.tool = "nvimdiff";

      merge.conflictstyle = "diff3";

      credential.helper = "store";

      color.ui = true;
    };
  };
}
