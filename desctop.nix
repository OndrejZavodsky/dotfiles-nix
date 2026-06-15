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
    # Fallback to tuigreet if you ever manually log out of Hyprland
    default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
      user = "greeter";
    		};
  		};
	};
	environment.systemPackages = with pkgs; [
		kitty
		waybar
		rofi
		hypridle
		hyprpaper
	];

}
