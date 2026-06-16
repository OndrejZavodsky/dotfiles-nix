{ config, pkgs, ... }: 

{

  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
  };
	programs.hyprlock.enable = true;
	security.pam.services.hyprlock = {};
	services.greetd = {
  enable = true;
  settings = {
    initial_session = {
      command = "start-hyprland";
      user = "ondrejz"; 
    };
    default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
      user = "greeter";
    		};
  		};
	};
	environment.systemPackages = with pkgs; [
		kitty
		waybar
		hypridle
		hyprpaper
	];

}
