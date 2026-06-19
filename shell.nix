{
  pkgs,
  config,
  ...
}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
          export PATH="$HOME/.local/bin:$PATH"

          dev() {
              local file
              file="$(fd . "$HOME" --type f --hidden --exclude .git | fzf)"
              [ -n "$file" ] && dev.sh "$file"
          }

          s() {
              if [ $# -eq 0 ]; then
                  echo "Please provide a search term."
                  return 1
              fi
              local query=$(echo "$*" | tr ' ' '+')
              w3m "https://search.brave.com/search?q=$query"
          }
      bind -x '"\C-f":dev'
    '';
    profileExtra = ''
      [[ -f ~/.bashrc ]] && source ~/.bashrc
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    settings = {
      add_newline = false;

      format = "$username$directory$git_branch$git_status$character";

      palettes.rose_pine = {
        base = "#191724";
        surface = "#1f1d2e";
        overlay = "#26233a";
        muted = "#6e6a86";
        subtle = "#908caa";
        text = "#e0def4";
        love = "#eb6f92";
        gold = "#f6c177";
        rose = "#ebbcba";
        pine = "#31748f";
        foam = "#9ccfd8";
        iris = "#c4a7e7";
      };

      palette = "rose_pine";
      username = {
        show_always = true;
        style_user = "bold gold";
        style_root = "bold love";
        format = "[$user]($style) ";
      };

      character = {
        success_symbol = "[❯](bold iris)";
        error_symbol = "[❯](bold love)";
      };

      directory = {
        style = "bold foam";
        truncate_to_repo = true;
        truncation_length = 3;
      };

      git_branch = {
        symbol = " ";
        style = "muted";
        format = "on [$symbol$branch](bold rose) ";
      };

      git_status = {
        format = "([\\[$all_status$ahead_behind\\] ](subtle))";
        style = "bold love";

        conflicted = "=";
        ahead = "⇡";
        behind = "⇣";
        diverged = "⇕";
        untracked = "?";
        staged = "+";
        modified = "!";
        stashed = "$";
        renamed = "»";
        deleted = "✘";
      };
    };
  };
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
}
