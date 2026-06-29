{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.game;
in {
  options.modules.game = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable gaming packages and configurations.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      heroic
      faugus-launcher
    ];
  };
}
